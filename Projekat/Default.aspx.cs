using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekat
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        void InsertNewsletter(SqlConnection connection, string ime, string email)
        {
            try
            {
                connection.Open();
                SqlParameter p1 = new SqlParameter();
                SqlParameter p2 = new SqlParameter();

                p1.Value = ime;
                p2.Value = email;

                p1.ParameterName = "@ime";
                p2.ParameterName = "@email";

                string upit = "INSERT INTO Novosti (Ime,Gmail) VALUES(@ime,@email)";
                SqlCommand command = new SqlCommand(upit, connection);

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
                ImeTekst.Text = EmailTekst.Text = "";
                Label3.Text = "PRETPLATILI STE SE ZA OBAVESTENJA HVALA VAM!";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Data Source=LAPTOP-D590CCR7;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False
            SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            ImeTekst.CssClass = "form-control centriraj";
            EmailTekst.CssClass = "form-control centriraj";
            if (Page.IsValid)
            {
                try
                {
                    string Ime = ImeTekst.Text;
                    string Email = EmailTekst.Text;
                    InsertNewsletter(connection, Ime, Email);
                }
                catch (Exception x)
                {
                    Debug.WriteLine(x.Message);
                    Debug.WriteLine(x.StackTrace);
                }
            }
            else
            {
               ValidationSummary1.Visible=true;
            }
        }
    }
}