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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-SHGR6TR\\SQLEXPRESS;Initial Catalog=YemekSepeti;Integrated Security=True");
        private void button1_Click(object sender, EventArgs e)
        {
            label1.Text = "Cüzdana para yükleme işlemi yapılmadan önce WalletLog tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from WalletLog", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox4.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Cüzdana para yükleme işlemi yapıldıktan sonra WalletLog tablosu";
            dataAdapter = new SqlDataAdapter("Select * from WalletLog", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button12_Click(object sender, EventArgs e)
        {
            label1.Text = "Sepete yemek eklemeden önce sepetin toplam fiyatı";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Basket where BasketID = 2", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox8.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Sepete yemek ekledikten sonra sepetin toplam fiyatı";
            dataAdapter = new SqlDataAdapter("select * from Basket where BasketID = 2", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button3_Click(object sender, EventArgs e)
        {
            label1.Text = "Insert işleminden sonra Sepet Yemek Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox2.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label1.Text = "Update işleminden sonra Digital Wallet Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox1.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button11_Click(object sender, EventArgs e)
        {
            label1.Text = "Yemek tablosundan bir yemeği silmeden önce FoodLog Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from FoodLog", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox7.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Yemek tablosundan bir yemeği sildikten(kaldırdıktan) sonra FoodLog Tablosu";
            dataAdapter = new SqlDataAdapter("select * from FoodLog", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button4_Click(object sender, EventArgs e)
        {
            label1.Text = "Delete işleminden sonra Yemek Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox3.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button5_Click(object sender, EventArgs e)
        {
            label2.Text = "Müşteri Sepet Bilgisi";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Basket where BasketID = 2", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];

        }
    }
}
