using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace _171044098_CSE414
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-SHGR6TR\\SQLEXPRESS;Initial Catalog=YemekSepeti;Integrated Security=True");
        private void Form1_Load(object sender, EventArgs e)
        {
            
            dataGridView1.Width = this.Width - 21;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            label1.Text = "Orijinal Customer tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "View ve inner join kullanılarak genişletilmiş Customer tablosu(view'i)";
            dataAdapter = new SqlDataAdapter(textBox15.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button13_Click(object sender, EventArgs e)
        {
            label1.Text = "Orijinal Order tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Orders", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "View ve inner join kullanılarak genişletilmiş Order tablosu(view'i)";
            dataAdapter = new SqlDataAdapter(textBox1.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button15_Click(object sender, EventArgs e)
        {
            label1.Text = "Orijinal Restaurant tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Restaurant", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "View ve inner join kullanılarak genişletilmiş Restaurant tablosu(view'i)";
            dataAdapter = new SqlDataAdapter(textBox4.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button14_Click(object sender, EventArgs e)
        {
            label1.Text = "Orijinal Food tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Food", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "View ve inner join kullanılarak 40 tl altındaki yemeklerin tablosu(view'i)";
            dataAdapter = new SqlDataAdapter(textBox3.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button16_Click(object sender, EventArgs e)
        {
            label1.Text = "Orijinal Review tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Review", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "View ve inner join kullanılarak genişletilmiş Review tablosu(view'i)";
            dataAdapter = new SqlDataAdapter(textBox2.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }


        private void viewsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            

            MessageBox.Show("You are already in Views!!");
        }

        private void triggersToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form2 nForm = new Form2();
            nForm.Show();
        }

        private void joinQueriesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form3 nForm = new Form3();
            nForm.Show();
        }

        private void ınheritanceToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form4 nForm = new Form4();
            nForm.Show();
        }

        private void transactionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form5 nForm = new Form5();
            nForm.Show();
        }

        private void storeProcedureToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form6 nForm = new Form6();
            nForm.Show();
        }
    }
}
