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
    public partial class Form6 : Form
    {
        public Form6()
        {
            InitializeComponent();
        }
        SqlConnection connection = new SqlConnection("Data Source=DESKTOP-SHGR6TR\\SQLEXPRESS;Initial Catalog=YemekSepeti;Integrated Security=True");
        private void button6_Click(object sender, EventArgs e)
        {
            label1.Text = "Store Procedure ile insert işleminden önce customer tablosu";
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            try
            {
                

                connection.Open();
                SqlCommand kayitEkle = new SqlCommand(textBox13.Text, connection);
                kayitEkle.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                label4.Text = ex.Message;
            }
            finally
            {
                connection.Close();
            }


            label2.Text = "Store Procedure ile insert işleminden sonra customer tablosu";
            dataAdapter = new SqlDataAdapter("select * from Customer", connection);
            ds = new DataSet();
            dataAdapter.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
        }
    }
}
