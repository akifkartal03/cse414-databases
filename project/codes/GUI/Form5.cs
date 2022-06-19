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
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-SHGR6TR\\SQLEXPRESS;Initial Catalog=YemekSepeti;Integrated Security=True");
        private void groupBox5_Enter(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            label1.Text = "Sipariş vermeden önce müşteri sepet bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox14.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button5_Click(object sender, EventArgs e)
        {
            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox11.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label1.Text = "Sipariş vermeden önce Restaurant Hesap bakiye bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from DigitalWallet where WalletID = (select WalletIDF from Restaurant where RestaurantID = 1)", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "Sipariş vermeden önce Customer Hesap bakiye bilgileri";
            dataAdapter = new SqlDataAdapter("Select * from DigitalWallet where WalletID = (select WalletIDF from Customer where BasketIDF = 4)", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button18_Click(object sender, EventArgs e)
        {
            bool isError = false;
            try
            {
                connection.Open();
                SqlCommand kayitEkle = new SqlCommand(textBox12.Text, connection);
                kayitEkle.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                label4.Text = ex.Message;
                isError = true;
            }
            finally
            {
                connection.Close();
            }

            if (!isError)
            {
                label4.Text = "Başarılı";
            }

            label1.Text = "Sipariş insert işleminden sonra Restaurant Hesap bakiye bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from DigitalWallet where WalletID = (select WalletIDF from Restaurant where RestaurantID = 1)", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "Sipariş insert işleminden sonra Customer Hesap bakiye bilgileri";
            dataAdapter = new SqlDataAdapter("Select * from DigitalWallet where WalletID = (select WalletIDF from Customer where BasketIDF = 4)", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            label2.Text = "Sipariş vermeden önce müşteri hesap bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox1.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }
    }
}
