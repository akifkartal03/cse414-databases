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

        private void button1_Click(object sender, EventArgs e)
        {
            label1.Text = "Cüzdana para yükleme işlemi yapılmadan önce WalletLog tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from WalletLog", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox4.Text,connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Cüzdana para yükleme işlemi yapıldıktan sonra WalletLog tablosu";
            dataAdapter = new SqlDataAdapter("Select * from WalletLog", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button2_Click(object sender, EventArgs e)
        {
            label1.Text = "Normal Offer Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Offer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "Offer Tablosundan türeyen Coupon Bilgileri";
            dataAdapter = new SqlDataAdapter(textBox9.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button3_Click(object sender, EventArgs e)
        {
            label1.Text = "Customer ve Order tablosu Left Outer Join Sonucu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox1.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button6_Click(object sender, EventArgs e)
        {
            label2.Text = "Customer ve Order tablosu Right Outer Join Sonucu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox2.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button7_Click(object sender, EventArgs e)
        {
            label1.Text = "Customer ve Order tablosu Full Outer Join Sonucu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(textBox3.Text, connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button6_Click_1(object sender, EventArgs e)
        {
            label1.Text = "Store Procedure ile insert işleminden önce customer tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox13.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Store Procedure ile insert işleminden sonra customer tablosu";
            dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            label1.Text = "Orijinal Customer tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "View ve inner join kullanılarak genişletilmiş Customer tablosu(view'i)";
            dataAdapter = new SqlDataAdapter("Select * from vm_Customer", connection);
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
            dataAdapter = new SqlDataAdapter("Select * from vm_Order", connection);
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
            dataAdapter = new SqlDataAdapter("Select * from vm_Restaurant", connection);
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
            dataAdapter = new SqlDataAdapter("Select * from vm_Max40Food", connection);
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
            dataAdapter = new SqlDataAdapter("Select * from vm_Comment", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button17_Click(object sender, EventArgs e)
        {
            label1.Text = "Normal Offer Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Offer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "Offer Tablosundan türeyen Campaign Bilgileri";
            dataAdapter = new SqlDataAdapter(textBox10.Text, connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
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
                label3.Text = ex.Message;
                isError = true;
            }
            finally
            {
                connection.Close();
            }

            if (!isError)
            {
                label3.Text = "Başarılı";
            }

            label1.Text = "Sipariş verdikten sonra Restaurant Hesap bakiye bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from DigitalWallet where WalletID = (select WalletIDF from Restaurant where RestaurantID = 1)", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            label2.Text = "Sipariş verdikten sonra Customer Hesap bakiye bilgileri";
            dataAdapter = new SqlDataAdapter("Select * from DigitalWallet where WalletID = (select WalletIDF from Customer where BasketIDF = 4)", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button9_Click(object sender, EventArgs e)
        {
            label1.Text = "Siparişe yorum yapmadan önce ortalama restaurant puanı";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox13.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Siparişe yorum yaptıkdan sonra ortalama restaurant puanı";
            dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button10_Click(object sender, EventArgs e)
        {
            label1.Text = "Sepete yemek eklemeden önce sepetin toplam fiyatı";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox13.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Sepete yemek ekledikten sonra sepetin toplam fiyatı";
            dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button11_Click(object sender, EventArgs e)
        {
            label1.Text = "Yemek tablosundan bir yemeği silmeden önce FoodLog Tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox13.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Yemek tablosundan bir yemeği sildikten(kaldırdıktan) sonra FoodLog Tablosu";
            dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button12_Click(object sender, EventArgs e)
        {
            label1.Text = "Sipariş vermeden önce sepetin durumu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];

            connection.Open();
            SqlCommand kayitEkle = new SqlCommand(textBox13.Text, connection);
            kayitEkle.ExecuteNonQuery();
            connection.Close();

            label2.Text = "Sipariş verdikten sonra sepetin durumu";
            dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }

        private void button8_Click(object sender, EventArgs e)
        {
            label1.Text = "Sipariş vermeden önce Customer sepet bilgileri";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("Select * from Basket where BasketID = 4", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
    }
}
