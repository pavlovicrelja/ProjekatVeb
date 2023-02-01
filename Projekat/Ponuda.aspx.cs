using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace Projekat
{
    public partial class Ponuda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DizajnDugme_Click(object sender, EventArgs e)
        {
            NaslovProjekta.Text = NaslovDizajnSajta.Text;
        }

        protected void SajtDugme_Click(object sender, EventArgs e)
        {
            NaslovProjekta.Text = NaslovIzradaSajta.Text;
        }

        protected void FullStackDugme_Click(object sender, EventArgs e)
        {
            NaslovProjekta.Text = NaslovFullStack.Text;
        }

        protected void PosaljiDetalje_Click1(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection("Data Source=RELJA;Initial Catalog=baza;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            try
            {
                if (Page.IsValid)
                {
                    string naslov = NaslovProjekta.Text;
                    string ime = ImeKompanijeTekst.Text;
                    string email = EmailTekst.Text;
                    string detalji = DetaljiTekst.Text;
                    InsertUProjekat(connection, naslov, ime, email, detalji);
                    Label1.Text = "USPESNO STE POSLALI ZAHTEV ZA SARADNJU";
                }
                else
                {
                    ValidationSummary1.Visible = true;
                }
                //Response.Redirect("~/Ponuda", false);
            }
            catch (Exception x)
            {
                Debug.WriteLine(x.Message);
                Debug.WriteLine(x.StackTrace);
            }
        }

        void InsertUProjekat(SqlConnection connection, string naslov, string imeKompanije, string email, string deatalji)
        {
            try
            {
                connection.Open();
                SqlParameter p1 = new SqlParameter();
                SqlParameter p2 = new SqlParameter();
                SqlParameter p3 = new SqlParameter();
                SqlParameter p4 = new SqlParameter();

                p1.ParameterName = "@naslov";
                p1.Value = naslov;

                p2.Value = imeKompanije;
                p2.ParameterName = "@imeKompanije";

                p3.Value = email;
                p3.ParameterName = "@email";

                p4.Value = deatalji;
                p4.ParameterName = "@detalji";

                string upit = "INSERT INTO Projekat (Naslov,ImeKompanije,Email,Detalji) VALUES(@naslov,@imeKompanije,@email,@detalji)";

                SqlCommand command = new SqlCommand(upit, connection);
                command.Parameters.Add(p1);
                command.Parameters.Add(p2);
                command.Parameters.Add(p3);
                command.Parameters.Add(p4);
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
                NaslovProjekta.Text = ImeKompanijeTekst.Text = EmailTekst.Text = DetaljiTekst.Text = "";

            }
        }
    }
}