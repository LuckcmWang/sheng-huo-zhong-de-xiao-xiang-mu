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
    public partial class accountant : Form
    {
        public accountant()
        {
            InitializeComponent();
            Control.CheckForIllegalCrossThreadCalls = false;
        }

        private void book_RowStateChanged(object sender, DataGridViewRowStateChangedEventArgs e)
        {
            for (int i = 0; i < this.book.Rows.Count; i++)
            {
                DataGridViewRow r = this.book.Rows[i];
                r.HeaderCell.Value = string.Format("{0}", i + 1);
            }
            this.book.Refresh();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void check_Click(object sender, EventArgs e)
        {
            String stime = startime.Value.ToString("yyyy-MM-dd");
            stime += " 00:00:00";
            String etime = endtime.Value.ToString("yyyy-MM-dd");
            etime += " 00:00:00";
            String connetStr = System.Configuration.ConfigurationManager.ConnectionStrings["ClassRoomConnectionString"].ToString();
            MySqlConnection conn = new MySqlConnection(connetStr);
            conn.Open();
            String sql = "SELECT linecodes,salesname,count(*),price FROM records WHERE datatime BETWEEN STR_TO_DATE(@para1,'%Y-%m-%d %H:%i:%s') AND STR_TO_DATE(@para2,'%Y-%m-%d %H:%i:%s') GROUP BY linecodes";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("para1", stime);
            cmd.Parameters.AddWithValue("para2", etime);
            MySqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (!reader.HasRows)
            {
                MessageBox.Show("该时段没有商品出售记录");
                MessageBox.Show(stime);
                MessageBox.Show(etime);
            }
            Thread th3 = new Thread(new ParameterizedThreadStart(add_record));
            th3.Start(reader);
        }

        private void add_record(object reader)
        {
            MySqlDataReader r = (MySqlDataReader)reader;
            Allcost.money = 0.0;
            Allcost.count = 0;
            while (r.Read())
            {
                String[] salesRecord = { Convert.ToString(r[0]), Convert.ToString(r[1]), Convert.ToString(r[2]), "￥ " + Convert.ToString(Convert.ToDouble(r[2]) * Convert.ToDouble(r[3])) + " 元" };
                Allcost.money += Convert.ToDouble(r[2]) * Convert.ToDouble(r[3]);
                Allcost.count += Convert.ToInt32(r[2]);
                book.Rows.Add(salesRecord);
            }
            salenum.Text = Convert.ToString(Allcost.count);
            salemoney.Text = Convert.ToString(Allcost.money);
            Thread t = Thread.CurrentThread;
            t.Abort();
        }

        private void accountant_FormClosing(object sender, FormClosingEventArgs e)
        {
            book.Rows.Clear();
            System.Environment.Exit(0);   
        }

    }
}
