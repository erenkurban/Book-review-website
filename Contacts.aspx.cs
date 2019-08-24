using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object kullanici = Session["KULLANICIADI"];
        if (kullanici != null)
        {
            pnlSign.Visible = false;
            pnlKullanici.Visible = true;
            lblkullaniciAdi.Text = kullanici.ToString();


        }
        else
        {
            pnlSign.Visible = true;
            pnlKullanici.Visible = false;

        }

        Duyurular();
    }
    private void Duyurular()
    {
        var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        var commandText = "SELECT * from DUYURULAR order by TARIH";


        var command = new SqlCommand(commandText, connection);


        connection.Open();

        SqlDataReader dr = command.ExecuteReader();
        lstDuyuru.DataSource = dr;
        lstDuyuru.DataBind();
        connection.Close();
    }



    protected void btnSgn_Click(object sender, EventArgs e)
    {
        var kullaniciAdi = txtkullaniciadi.Text;
        var sifre = txtsifre.Text;


        var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        var commandText = "SELECT * from KULLANICI Where KULLANICIADI = @kullaniciadi AND SIFRE = @sifre";


        var command = new SqlCommand(commandText, connection);

        command.Parameters.AddWithValue("@kullaniciadi", kullaniciAdi);
        command.Parameters.AddWithValue("@sifre", sifre);
        connection.Open();

        SqlDataReader dr = command.ExecuteReader();

        if (dr.Read())
        {
            Session.Timeout = 300;
            Session.Add("kullaniciadi", dr["KULLANICIADI"].ToString());
            Response.Redirect(Request.RawUrl);


        }
        else
        {

            lblSonuc.Text = "Sorry, we didn’t recognize that username/password combination. Please try again.";
        }
        connection.Close();



    }
    protected void btnOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect(Request.RawUrl);
    }

    protected void contSend_Click(object sender, EventArgs e)
    {
        var konuAdi = conKonu.Text;
        var yorum = conYorum.Text;


        if (!String.IsNullOrWhiteSpace(konuAdi) && !String.IsNullOrWhiteSpace(yorum))
        {
            var commandText = "INSERT INTO CONTACTS (KONU,YORUM) Values (@konuAdi,@yorum);";


            var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@konuAdi", konuAdi);
                command.Parameters.AddWithValue("@yorum", yorum);

                try
                {
                    connection.Open();
                    var result = command.ExecuteNonQuery();
                    lblYorumSonuc.Text = "Your command has been sent";
                }
                catch (Exception)
                {


                    lblYorumSonuc.Text = "Please Try Again";

                }
            }
        }
        else
        {
            lblYorumSonuc.Text = "You should fill in the blank fields";
        }

    }
}