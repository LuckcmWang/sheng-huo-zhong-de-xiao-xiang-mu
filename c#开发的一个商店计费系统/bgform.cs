using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class bgform : Form
    {
        public bgform()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            var add_form1 = new add_form();
            add_form1.ShowDialog();
            //this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var work_form1 = new worktime();
            work_form1.ShowDialog();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            var accountant1 = new accountant();
            accountant1.ShowDialog();
        }
    }
}
