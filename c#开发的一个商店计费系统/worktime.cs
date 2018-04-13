using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WindowsFormsApplication1
{
    public partial class worktime : Form
    {
        public worktime()
        {
            InitializeComponent();
            Control.CheckForIllegalCrossThreadCalls = false;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void worktime_Load(object sender, EventArgs e)
        {
            Allcost.money = 0.0;
            Thread th1 = new Thread(new ThreadStart(work_Man)); 
            th1.Start();
        }


        private void work_Man()
        {
            String connetStr = System.Configuration.ConfigurationManager.ConnectionStrings["ClassRoomConnectionString"].ToString();
            MySqlConnection conn = new MySqlConnection(connetStr);
            conn.Open();
            MySqlDataReader reader;
            while (true)
            {
                Thread.Sleep(1000);
                if (lcode_in.Text == "") continue;
                if (lcode_in.Text == " ")
                {
                    clear_all.PerformClick();
                    continue;
                }
                String lcode = lcode_in.Text;
                lcode_in.Clear();
                String sql = "select * from salesinfo where linecodes=@para1";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("para1", lcode);
                reader = cmd.ExecuteReader();
                if (!reader.HasRows) {
                    lcode_in.Text = "该商品条形码及相关信息未录入本系统";
                    Thread.Sleep(1100);
                    lcode_in.Clear();
                    reader.Close();
                    continue;
                }
                reader.Read();
                String[] row_add = { Convert.ToString(reader[0]), Convert.ToString(reader[1]), "￥ " + Convert.ToString(reader[2]) + " 元" };
                Allcost.money += Convert.ToDouble(reader[2]);
                Thread th2 = new Thread(new ParameterizedThreadStart(add_row));
                th2.Start(row_add);
                totalcost.Text = Convert.ToString(Allcost.money);
                String[] record = { Convert.ToString(reader[0]), Convert.ToString(reader[1]), Convert.ToString(reader[2])};
                Thread th3 = new Thread(new ParameterizedThreadStart(add_record));
                th3.Start(record);
                reader.Close();
            }
        }
        //一个新的函数要一个线程来单独运行的情况新建线程
        private void add_row(object row_add)
        {
            saleslist.Rows.Add((string[])row_add);
            Thread th = Thread.CurrentThread;
            th.Abort();
        }
        private void add_record(object record)
        {
            String[] r = (string[])record;
            String connetStr = System.Configuration.ConfigurationManager.ConnectionStrings["ClassRoomConnectionString"].ToString();
            MySqlConnection conn = new MySqlConnection(connetStr);
            conn.Open();
            String sql = "insert into records(linecodes,salesname,datatime,price) values(@para1,@para2,@para3,@para4)";
            MySqlCommand cmd1 = new MySqlCommand(sql, conn);
            cmd1.Parameters.AddWithValue("para1", r[0]);
            cmd1.Parameters.AddWithValue("para2", r[1]);
            cmd1.Parameters.AddWithValue("para3", DateTime.Now.ToString());
            cmd1.Parameters.AddWithValue("para4", Convert.ToDouble(r[2]));
            cmd1.ExecuteNonQuery();
            Thread th = Thread.CurrentThread;
            th.Abort();
        }

        private void clear_all_Click(object sender, EventArgs e)
        {
            Allcost.money = 0.0;
            lcode_in.Clear();
            totalcost.Text = "";
            saleslist.Rows.Clear();
            lcode_in.Focus();
        }

        
        private void totalcost_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void lcode_in_TextChanged(object sender, EventArgs e)
        {

        }

        private void saleslist_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void saleslist_RowStateChanged(object sender, DataGridViewRowStateChangedEventArgs e)
        {
            for (int i = 0; i < this.saleslist.Rows.Count; i++)
            {
                DataGridViewRow r = this.saleslist.Rows[i];
                r.HeaderCell.Value = string.Format("{0}", i + 1);
            }
            this.saleslist.Refresh();
        }

        private void worktime_FormClosing(object sender, FormClosingEventArgs e)
        {
            clear_all.PerformClick();
            System.Environment.Exit(0);   
        }
    }
}
