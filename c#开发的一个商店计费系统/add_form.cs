using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WindowsFormsApplication1
{
    public partial class add_form : Form
    {
        public add_form()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter_1(object sender, EventArgs e)
        {

        }

        private void add_form_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            linecode.Clear();
            price.Clear();
            salesname.Clear();
            linecode.Focus();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (linecode.Text == "" || salesname.Text == "" || price.Text == "")
            {
                situation.Text = "上方栏目不能为空";
                return;
            }
            String lcode = linecode.Text;
            String sname = salesname.Text;
            Double sprice = Convert.ToDouble(price.Text);

            // server=127.0.0.1/localhost 代表本机，端口号port默认是3306可以不写
            //String connetStr = "server=localhost;port=3306;user=root;password=905028243; database=linecode;";
            String connetStr = System.Configuration.ConfigurationManager.ConnectionStrings["ClassRoomConnectionString"].ToString();
            MySqlConnection conn = new MySqlConnection(connetStr);
            conn.Open();

            String sql = "select * from salesinfo where linecodes=@para1";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("para1", lcode);
            Object result1 = cmd.ExecuteScalar();
            if (result1 != null)
            {
                sql = "update salesinfo set salesname=@para1,price=@para2 where linecodes=@para3";
                cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("para1", sname);
                cmd.Parameters.AddWithValue("para2", sprice);
                cmd.Parameters.AddWithValue("para3", lcode);
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    situation.Text = "改价成功";
                    linecode.Clear();
                    salesname.Clear();
                    price.Clear();
                    linecode.Focus();
                }
                return;
            }

            sql = "insert into salesinfo(linecodes,salesname,price) values(@para3,@para1,@para2)";
            cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("para1", sname);
            cmd.Parameters.AddWithValue("para2", sprice);
            cmd.Parameters.AddWithValue("para3", lcode);
            int result2 = cmd.ExecuteNonQuery();
            if (result2 == 1)
            {
                situation.Text="添加成功";
                linecode.Clear();
                salesname.Clear();
                price.Clear();
                linecode.Focus();
            }
            else
            {
                situation.Text = "添加失败";
                linecode.Clear();
                salesname.Clear();
                price.Clear();
                linecode.Focus();
            }
        }

        private void price_TextChanged(object sender, EventArgs e)
        {

        }

        private void linecode_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void situation_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
