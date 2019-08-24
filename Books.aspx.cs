using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Books : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        backToBook.Visible = false;
        pnlList.Visible = false;
        pnlIncelemeYaz.Visible = false;


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

    protected void btnsign_Click(object sender, EventArgs e)
    {
        var kullaniciAdi = txtkullaniciadi.Text;
        var sifre = txtsifre.Text;


        if (!String.IsNullOrWhiteSpace(kullaniciAdi) && !String.IsNullOrWhiteSpace(sifre))
        {

            var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
            var commandText = "INSERT INTO KULLANICI (KULLANICIADI,SIFRE) Values (@kullaniciAdi,@sifre);";




            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                command.Parameters.AddWithValue("@sifre", sifre);

                try
                {
                    connection.Open();
                    var result = command.ExecuteNonQuery();

                    lblSonuc.Text = "You are successfully logged in.";
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


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "btnReview")
        {

            pnlGw.Visible = false;
            pnlList.Visible = true;

            var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
            SqlConnection connection = new SqlConnection(connectionString);

            int index = Convert.ToInt32(e.CommandArgument);
            TableRow secili_satir = GridView1.Rows[index];

            var kitap_adi = secili_satir.Cells[0].Text;


            var commandText = "SELECT * from INCELE WHERE KITAPADI = @kitap_adi";
            var command = new SqlCommand(commandText, connection);

            command.Parameters.AddWithValue("@kitap_adi", kitap_adi);


            connection.Open();
            SqlDataReader dr = command.ExecuteReader();
            lstGrid.DataSource = dr;
            lstGrid.DataBind();
            connection.Close();







            

            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
            SqlConnection connection_ = new SqlConnection(connectionString);

            index = Convert.ToInt32(e.CommandArgument);
            

            kitap_adi = secili_satir.Cells[0].Text;


            commandText = "SELECT * from KITAPLAR WHERE KITAPADI = @kitap_adi";
            command = new SqlCommand(commandText, connection_);

            command.Parameters.AddWithValue("@kitap_adi", kitap_adi);


            connection_.Open();
            dr = command.ExecuteReader();
            lslBilgi.DataSource = dr;
            lslBilgi.DataBind();
            connection_.Close();





        }
        else if (e.CommandName == "writeRvw")
        {
            object kullanici = Session["KULLANICIADI"];
            if (kullanici != null)
            {



                int index = Convert.ToInt32(e.CommandArgument);
                TableRow secili_satir = GridView1.Rows[index];
                pnlGw.Visible = false;
                pnlList.Visible = false;
                pnlIncelemeYaz.Visible = true;
            }
            else
            {
                pnlGw.Visible = false;
                pnlList.Visible = false;
                pnlIncelemeYaz.Visible = false;
                lblrew.Text = "Please Sign In or Sign Up";
            }
        }


    }





    protected void btnSend_Click(object sender, EventArgs e)
    {

        var kullaniciAdi = ddlKitap.SelectedItem.ToString();
        var inceleme = txtinceleme.Text;
        var puan = GradeBox.SelectedValue;



        if (!String.IsNullOrWhiteSpace(kullaniciAdi) && !String.IsNullOrWhiteSpace(inceleme))
        {
            object kulAdd = Session["KULLANICIADI"];
            var kullAdd = kulAdd.ToString();

            var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Books"].ConnectionString;
            var commandText = "INSERT INTO INCELE (KULLANICIADI,INCELEMEYAZISI,PUAN,KITAPADI) VALUES (@kullAdd,@inceleme,@puan,@kullaniciAdi)";

            





            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                var command = new SqlCommand(commandText, connection);
                command.Parameters.AddWithValue("@kullAdd", kullAdd);
                command.Parameters.AddWithValue("@inceleme", inceleme);
                command.Parameters.AddWithValue("@puan", puan);
                command.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                


                

                try
                {
                    connection.Open();
                    
                    var result = command.ExecuteNonQuery();
                    backToBook.Visible = true;

                    lblrew.Text = "Your review has been sent.";
                }
                catch (Exception)
                {


                    lblrew.Text = "Error";

                }
            }
        }
        else
        {
            lblrew.Text = "You should fill in the blank fields";
        }



    }
}