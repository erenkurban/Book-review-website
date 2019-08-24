<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Rating Blog</title>
    <link href="StyleSheet.css" rel="stylesheet" />
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

           <div class="sosyalMedya">
              <img src="sosyal-medya-takip.jpg" width="650px" height="300px" />
          </div>
            <div class="paragraf">
                <h4>
                    Kitap ve Biz
                </h4><br /><br />
                Bilgi ve kültüre ulaşmak her insanın hedeflediği bir şeydir. Kitaplar bilgi ve kültürün en yoğun olduğu kaynaklardır. Kitap okumak ise bir alışkanlıktır. Alışkanlığı olmayan kişilere büyük bir iş yükü gibi gelir ancak kitap okuyup başından hiç kalkmak istemeyenler de mevcuttur. Bazı insanlar yalnızlıklarını kitaplar sayesinde giderirler. Sevinç ve mutluluğu kitapta bulmak işten bile değildir.<br /><br />
                Kitap okuyanlar arasında da sevilen tür ayrımı vardır. Şiir kitaplarını seven insanlar, öykü kitaplarını seven insanlar bulunabilir. Bunları sevenler bir diğerini sevmeyebilir. Kimileri romanı, masalı, hikayeyi kişiliğin aynası olarak görürken kimileri şiirlerin arkasındaki anlamı yakalamanın bir duygu patlaması olduğunu düşünür.<br /><br />
                Kitaplardan kültür edindiğimiz gibi kitap okumanın da ayrı bir kültür olduğunu unutmamalıyız. Kitap okunurken sayfaları yıpratılmamalıdır. Kitaba güzel bakılmalıdır. Çünkü kitaplar insanın dostudur. Ancak ona güzel bakılırsa insan onun gerçekten dostu olduğunu kavrar. Ve bir kez kavradı mı elinden kitabı düşürmez. Çünkü aynı dostluğu hiç bir yerde bulamazsın.<br />

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
