<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contacts</title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 203px;
        }
        .auto-style2 {
            height: 67px;
        }
        .auto-style3 {
            height: 67px;
            width: 178px;
        }
        .auto-style4 {
            height: 203px;
            width: 178px;
        }
        .auto-style6 {
            margin-left: 9px;
        }
        .auto-style7 {
            margin-left: 9px;
            margin-top: 4;
        }
        .auto-style8 {
            margin-left: 6px;
            margin-top: 8;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <div id="site">
    
        <header>
            <div class="logo">
                <img src="logokitap.jpg" width="60" height="50" />
                
            </div>
            <nav>
                <ul>

                    <li>
                    <a href="default.aspx">HOME</a>
                    </li>
                    <li>
                        <a href="Books.aspx">BOOKS</a>
                    </li>
                    <li>
                        <a href="Contacts.aspx">CONTACTS</a>
                    </li>
                
                </ul>
            </nav>
            <div class="search">
                

                
            </div>

            <div class="sign">
                <ul>
                    
                    <li>
                        <a href="join.aspx">JOIN</a>
                    </li>
                </ul>
            </div>

        </header>
        <div class="resim">

            <img src="sitebanner.jpg" width="960" height="230" />


        </div>
        <div class="sagtaraf">

            <table class="resim">
                <tr>
                    <td class="auto-style3" style="border: thin solid #000000; text-align: right; background-color: #E2E2E2;">KONU</td>
                    <td class="auto-style2" style="text-align: left; border: thin solid #000000; background-color: #E2E2E2;">
                        <asp:TextBox ID="conKonu" runat="server" CssClass="auto-style6" Height="24px" Width="447px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="border: thin solid #000000; text-align: right; background-color: #E2E2E2;">YORUM</td>
                    <td class="auto-style1" style="text-align: left; border: thin solid #000000; background-color: #E2E2E2;">
                        <asp:TextBox ID="conYorum" runat="server" CssClass="auto-style7" Height="167px" TextMode="MultiLine" Width="452px"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:Button ID="contSend" runat="server" CssClass="auto-style8" Height="39px" Text="Send" Width="88px" OnClick="contSend_Click" />
            <asp:Label ID="lblYorumSonuc" Text="" runat="server" />
            </div>
      
      <asp:Panel ID="pnlSign" runat="server">
        <div class="quickSignUp">
             
            <div class="up">
                 Sign In
             </div>
            <div class="down">

                <span>UserName</span>

                <asp:TextBox ID="txtkullaniciadi" CssClass="txtsign"  runat="server" /> 
                
                <span>Password</span>

                
                
              
                <asp:TextBox ID="txtsifre" CssClass="txtsign" TextMode="Password" runat="server" /> 

                
                <a href="join.aspx" class="btnclass">Sign Up</a>

                <asp:Button ID="btnSgn" Text="Sign In" CssClass="btnSignIn" runat="server" OnClick="btnSgn_Click" />
                <br /><br /><br />
                <asp:Label ID="lblSonuc" Text="" runat="server" />
                

            </div>
           

        </div>

            </asp:Panel>
        
       

        <asp:Panel ID="pnlKullanici" CssClass="pnlKullanici" runat="server">
            <br />
            Welcome, <asp:Label ID="lblkullaniciAdi" Text="" runat="server" /><br />
            <asp:Button ID="btnOut" CssClass="btnOut" Text="Sign Out" runat="server" OnClick="btnOut_Click" />
        </asp:Panel>
           
         <div class="duyuru">
            <div class="duyuruUst">
                ANNOUNCEMENTS
            </div>
             <div class="duyuruAlt">
                 <asp:ListView ID="lstDuyuru" runat="server">
                     <ItemTemplate>
                         <div class="lslDuy">
                         <asp:Label Text='<%#Eval("BASLIK") %>' runat="server" /><br /><br />
                         <asp:Label Text='<%#Eval("TARIH") %>' runat="server" /><br /><br />
                         <asp:Label Text='<%#Eval("DUYURU") %>' runat="server" /><br /><br />
                         </div>
                     </ItemTemplate>
                 </asp:ListView>
             </div>
          
       </div>
      </div>


    </form>
</body>
</html>
