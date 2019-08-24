<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Join.aspx.cs" Inherits="Join" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <div style="width:350px;margin:0 auto; margin-top:70px;">

            <asp:Panel ID="pnlkyt" runat="server">

                 <div class="quickSignUp">
             
            <div class="up">
                 Sing Up
             </div>
            <div class="down">

                <span>UserName</span>

                <asp:TextBox ID="txtkullaniciadi" CssClass="txtsign"  runat="server" /> 
                
                <span>Password</span>
                <asp:TextBox ID="txtsifre" CssClass="txtsign" TextMode="Password" runat="server" /> 

                <asp:Button ID="btnsign" Text="Sign Up" CssClass="btnclass" runat="server" Onclick="btnsign_Click" />
               
                    <a href="Default.aspx" class="btnSignIn">Cancel</a>
                
                <br /><br /><br />

                <asp:Label ID="lblSonuc" Text="" runat="server" />
                

            </div>
           

        </div>

            </asp:Panel>
            <asp:Panel ID="pnlDurum" runat="server" style="padding-left:10px; margin-bottom:5px;">

                <asp:Label ID="lblDurum" Text="" runat="server" />
                <br /> <br />
                <a href="Default.aspx">Go to Home Page</a>
            </asp:Panel>

 
            </div>
    </form>
</body>
</html>
