using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Join : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlDurum.Visible = false;

    }

    protected void btnsign_Click(object sender, EventArgs e)
    {
        var kullaniciAdi = txtkullaniciadi.Text;
        var sifre = txtsifre.Text;


        var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        var commandText = "SELECT * from KULLANICI Where KULLANICIADI = @kullaniciadi";


        var command = new SqlCommand(commandText, connection);

        command.Parameters.AddWithValue("@kullaniciadi", kullaniciAdi);

        connection.Open();

        SqlDataReader dr = command.ExecuteReader();
        if (dr.Read())
        {
            lblSonuc.Text = "Username already exists.";




        }
        else {
            connection.Close();

            if (!String.IsNullOrWhiteSpace(kullaniciAdi) && !String.IsNullOrWhiteSpace(sifre))
            {


                connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
                commandText = "INSERT INTO KULLANICI (KULLANICIADI,SIFRE) Values (@kullaniciAdi,@sifre);";

                using (SqlConnection connection_ = new SqlConnection(connectionString))
                {
                    command = new SqlCommand(commandText, connection_);
                    command.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                    command.Parameters.AddWithValue("@sifre", sifre);

                    try
                    {
                        connection_.Open();
                        var result = command.ExecuteNonQuery();

                        lblDurum.Text = "You are successfully logged in.";
                        pnlDurum.Visible = true;
                        pnlkyt.Visible = false;
                        Session.Add("KULLANICIADI", kullaniciAdi);
                    }
                    catch (Exception)
                    {


                        lblSonuc.Text = "Error";

                    }
                }
            }

            else
            {
                lblSonuc.Text = "You should fill in the blank fields";
            }

        }


    }
}
