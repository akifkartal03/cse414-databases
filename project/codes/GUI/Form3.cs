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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-SHGR6TR\\SQLEXPRESS;Initial Catalog=YemekSepeti;Integrated Security=True");
        private void button3_Click(object sender, EventArgs e)
        {
            label1.Text = "Customer ve Email tablosu Left Outer Join Sonucu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox1.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void run_right_Click(object sender, EventArgs e)
        {
            label1.Text = "Customer ve Email tablosu Right Outer Join Sonucu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox2.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button7_Click(object sender, EventArgs e)
        {
            label1.Text = "Customer ve Email tablosu Full Outer Join Sonucu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox3.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
    }
}
