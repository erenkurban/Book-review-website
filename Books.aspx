<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books</title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 203px;
        }
        .auto-style3 {
            margin-left: 4px;
        }
        .auto-style4 {
            width: 203px;
            height: 242px;
        }
        .auto-style5 {
            height: 242px;
        }
        .auto-style6 {
            margin-left: 3px;
            margin-top: 0px;
        }
        .auto-style7 {
            width: 203px;
            height: 28px;
        }
        .auto-style8 {
            height: 28px;
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
          
          <asp:Panel ID="pnlGw" runat="server">

          <asp:GridView ID="GridView1" CssClass="GvKitap" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" AllowSorting="True" GridLines="None" ForeColor="#333333">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="KITAPADI" HeaderText="Kitap Adı" SortExpression="KITAPADI" />
                  <asp:BoundField DataField="YAZARADI" HeaderText="Yazar Adı" SortExpression="YAZARADI" />
                  <asp:BoundField DataField="KITABINTURU" HeaderText="Türü" SortExpression="KITABINTURU" />
                  <asp:ButtonField ButtonType="Button" CommandName="btnReview" HeaderText="Seçim" Text="Reviews">
                  <ControlStyle BackColor="#552B2B" Font-Bold="True" ForeColor="White" Height="50px" Width="80px" />
                  </asp:ButtonField>
                  <asp:ButtonField ButtonType="Button" CommandName="writeRvw" HeaderText="Seçim" Text="WriteReview">
                  <ControlStyle BackColor="#400000" Font-Bold="True" ForeColor="White" Height="50px" Width="80px" />
                  </asp:ButtonField>
              </Columns>
              <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
              <SortedAscendingCellStyle BackColor="#FDF5AC" />
              <SortedAscendingHeaderStyle BackColor="#4D0000" />
              <SortedDescendingCellStyle BackColor="#FCF6C0" />
              <SortedDescendingHeaderStyle BackColor="#820000" />
          </asp:GridView>

          
          
          
              
              <br />
          </asp:Panel>

          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [KITAPADI], [YAZARADI], [SAYFASAYISI], [KITABINTURU] FROM [KITAPLAR]">
          </asp:SqlDataSource>

          
         
          
          <asp:Panel ID="pnlList" CssClass="pnlListe" runat="server">
            
         
          <a href="Books.aspx">Back</a> <br /> <br />
              <h3>Kitap Bilgileri</h3><br />
              
              <asp:ListView ID="lslBilgi" runat="server">
                  <ItemTemplate>
                      <div class="kitapBilgileri">
                          Kitap Adi:<asp:Label Text='<%#Eval("KITAPADI") %>' runat="server" /><br /><br />
                          Yazar Adi:<asp:Label Text='<%#Eval("YAZARADI") %>' runat="server" /><br /><br />
                          Yayin Evi:<asp:Label Text='<%#Eval("YAYINEVI") %>' runat="server" /><br /><br />
                          Sayfa Sayısı:<asp:Label Text='<%#Eval("SAYFASAYISI") %>' runat="server" /><br /><br />
                          Basım Yılı:<asp:Label Text='<%#Eval("BASIMYILI") %>' runat="server" /><br /><br />
                          Kitap Türü:<asp:Label Text='<%#Eval("KITABINTURU") %>' runat="server" /><br /><br />

                         
                          

                      </div>

                  </ItemTemplate>
              </asp:ListView>
             


          
           <br /><br /><br />
              <h3>KULLANICI İNCELEMELERİ</h3>
              
           <asp:ListView ID="lstGrid" runat="server">
           <ItemTemplate>
               <div class="bilgiInc">
               
               Kullanıcı Adı: <asp:Label Text='<%#Eval("KULLANICIADI") %>' runat="server" /><br />
               Verilen Puan: <asp:Label Text='<%#Eval("PUAN") %>' runat="server" /><br />
               Inceleme Yazısı: <asp:Label Text='<%#Eval("INCELEMEYAZISI") %>' runat="server" /><br /><br />
               </div>
           </ItemTemplate>
       </asp:ListView>
              
              </asp:Panel> 
       
       
          <asp:Panel ID="pnlIncelemeYaz" runat="server">
             
              
               <h1>Write Review</h1><br />

              <table class="auto-style1" style="background-color: #B4B4B4; border: thin solid #000000">
            <tr style="border: thin solid #000000">
                <td class="auto-style2" style="border: thin solid #000000; text-align: right">Book Name:</td>
                <td>
                    <asp:DropDownList ID="ddlKitap" runat="server" DataSourceID="SqlDataSource2" DataTextField="KITAPADI" DataValueField="KITAPADI" Width="320px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BooksConnectionString2 %>" SelectCommand="SELECT [KITAPADI] FROM [KITAPLAR]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: thin solid #000000; text-align: right">Grade</td>
                <td class="auto-style8" style="border: thin solid #000000;">
                    <asp:DropDownList ID="GradeBox" runat="server" CssClass="auto-style3" Height="37px" Width="106px" >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="border: thin solid #000000">
                <td class="auto-style4" style="border: thin solid #000000; text-align: right">Review</td>
                <td class="auto-style5" style="border: thin solid #000000">
                    <asp:TextBox ID="txtinceleme" runat="server" CssClass="auto-style6" Height="221px" TextMode="MultiLine" Width="447px"></asp:TextBox>
                </td>
            </tr>
            
            
        </table>
              <br />


              <asp:Button ID="btnSend" Text="Send" Width="120px" Height="35px" BackColor="SlateGray" OnClick="btnSend_Click" runat="server" />
              
              
              <a href="Books.aspx" class="btnclass" >Back</a>
              



          </asp:Panel>
          <div class="divHata">
          <asp:Label ID="lblrew" Text="" runat="server" /><br />
              <asp:Panel ID="backToBook" runat="server">
                  <a href="Books.aspx">Back</a>
              </asp:Panel>
              
          </div>
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
                         <asp:Label Text='<%#Eval("BASLIK") %>' runat="server" /> <br /><br />
                         <asp:Label Text='<%#Eval("TARIH") %>' runat="server" /> <br /><br />
                         <asp:Label Text='<%#Eval("DUYURU") %>' runat="server" /> <br /><br />
                         </div>
                     </ItemTemplate>
                 </asp:ListView>
             </div>

           
       </div>
        
       

    </div>
    </form>
</body>
</html>
