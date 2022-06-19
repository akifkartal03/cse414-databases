using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _171044098_CSE414
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-SHGR6TR\\SQLEXPRESS;Initial Catalog=YemekSepeti;Integrated Security=True");
        private void button2_Click(object sender, EventArgs e)
        {
            

            label2.Text = "Offer Tablosundan türeyen Coupon Bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox9.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            label1.Text = "Normal Offer Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox1.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button17_Click(object sender, EventArgs e)
        {
            label2.Text = "Offer Tablosundan türeyen Campaign Bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox10.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }
    }
}
