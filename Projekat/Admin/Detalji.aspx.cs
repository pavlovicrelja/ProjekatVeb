using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Data;

namespace Projekat.Admin
{
    public partial class Detalji : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            try
            {
                InsertNewsletter(connection);
                InsertPorudzbine(connection);
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            try
            {
                GridViewRow row = GridView1.SelectedRow;
                if (row!=null)
                {

                    int id = Convert.ToInt32(row.Cells[1].Text.Trim());
                    DeleteNewsletter(connection,id);
                    //Response.Redirect("C:\\Users\\relja\\Desktop\\RELJA\\ProjekatWeb\\Projekat\\Projekat\\Admin\\Detalji.aspx", false);
                }
                else
                {

                }
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
                RefreshNewsletter();
            }
            finally
            {
                RefreshNewsletter();
            }

        }
        void InsertNewsletter(SqlConnection connection)
        {
            try
            {
                connection.Open();
                string upit = "SELECT * FROM Novosti";
                SqlCommand command = new SqlCommand(upit, connection);
                SqlDataReader reader = command.ExecuteReader();

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
                RefreshNewsletter();
            }
        }
        void InsertPorudzbine(SqlConnection connection)
        {
            try
            {
                connection.Open();
                string upit = "SELECT * FROM Projekat";
                SqlCommand command = new SqlCommand(upit, connection);
                SqlDataReader reader = command.ExecuteReader();

                GridView2.DataSource = reader;
                GridView2.DataBind();
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
            }
            finally
            {
                connection.Close();
                RefreshPorudzbine();
            }
        }
        void DeleteNewsletter(SqlConnection connection, int Id)
        {
            try
            {
                connection.Open();
                SqlParameter p = new SqlParameter();
                p.Value = Id;
                p.ParameterName= "@Id";

                string upit = "DELETE FROM Novosti WHERE Id=@Id";
                SqlCommand command = new SqlCommand(upit,connection);
                command.Parameters.Add(p);
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
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            row.Cells[0].ForeColor = Color.Red;
        }
        void RefreshNewsletter()
        {
            connection.Open();
            string upit = "SELECT * FROM Novosti";
            SqlDataAdapter adapter = new SqlDataAdapter(upit, connection);
            DataTable table= new DataTable();

            adapter.Fill(table);

            GridView1.DataSource= table;
            GridView1.DataBind();
            connection.Close() ;
        }

        void RefreshPorudzbine()
        {
            connection.Open();
            string upit = "SELECT * FROM Projekat";
            SqlDataAdapter adapter = new SqlDataAdapter(upit, connection);
            DataTable table = new DataTable();

            adapter.Fill(table);

            GridView2.DataSource = table;
            GridView2.DataBind();
            connection.Close();
        }
    }
}