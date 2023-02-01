using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;

namespace Projekat
{
    public partial class Testimonials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            SelectOcene(connection);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

            try
            {
                if (Page.IsValid)
                {
                    string ime = TextBox1.Text;
                    string komentar = TextBox3.Text;
                    int ocena = int.Parse(TextBox2.Text);
                    InsertOcene(connection, ime, komentar, ocena);
                }
                else
                {
                    ValidationSummary1.Visible = true;
                }
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
            }
            finally
            {
                SelectOcene(connection);
            }
            
        }
        void InsertOcene(SqlConnection connection,string ime,string komentar,int ocena)
        {
            try
            {
                connection.Open();
                SqlParameter p=new SqlParameter();
                SqlParameter p1=new SqlParameter();
                SqlParameter p2=new SqlParameter();

                p.ParameterName = "@ime";
                p.Value = ime;

                p1.ParameterName = "@komentar";
                p1.Value = komentar;

                p2.ParameterName = "@ocena";
                p2.Value = ocena;

                string upit = "INSERT INTO Ocene (Ime,Komentar,Ocena) VALUES(@ime,@komentar,@ocena)";

                SqlCommand command=new SqlCommand(upit,connection);
                command.Parameters.Add(p);
                command.Parameters.Add(p1);
                command.Parameters.Add(p2);
                command.ExecuteNonQuery();
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
            }
            finally
            {
                connection.Close();
                TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
            }
        }
        void SelectOcene(SqlConnection connection)
        {
            try
            {
                connection.Open();
                string upit = "SELECT * FROM Ocene";
                SqlCommand command=new SqlCommand(upit,connection);
                SqlDataReader reader=command.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}