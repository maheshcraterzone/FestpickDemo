<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FestivalDetails.aspx.cs" Inherits="FestPicks.Views.FestivalDetails" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>FILM</title>
    <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1' />
    <link href="../Content/css/main.css" rel="stylesheet" type="text/css">
    <link href="../Content/css/media.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

    <link rel="stylesheet" href="../Content/wow/animate.css">
    <link href="../Content/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="../Content/owl-carousel/owl.theme.css" rel="stylesheet">
</head>

<body>
    <form runat="server">
        <section class="banner_main">
            <div class="m_menu">
                <div class="menu">
                    <img src="../Content/images/menu.png" alt="" />
                </div>
                <ul class="m_nav">
                    <li><a href="ExploreFestival.aspx"  class="active">EXPLORE FESTIVALS</a></li>
                    <li><a href="WatchFilms.aspx">Watch Films</a></li>
                </ul>
            </div>

            <div class="explore_detail">
                <nav class="navigation">
                        <ul>
                            <li><a href="ExploreFestival.aspx"  class="active">EXPLORE FESTIVALS</a></li>
                            <li><a href="WatchFilms.aspx">Watch Films</a></li>
                            <!--<li><a href="SubmitYourFilm.aspx">SUBMIT YOUR FILM</a></li>
                        <li><a href="ContactUs.aspx">CONTACT US</a></li>-->
                        </ul>
                    </nav>
                <div class="container">
                    <div class="festival_detail">
                        <div class="thumb">
                            <img src="../Content/images/explore1.jpg" runat="server" alt="img" id="festimage" class="img_res" />
                            <%--<div class="title">
                            <asp:Label ID="lblDate" runat="server"></asp:Label></div>--%>
                        </div>
                        <div class="content">
                            <h1>
                                <asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
                            <h2>About</h2>
                            <div class="”content_scroll”">
                                <asp:Literal ID="ltrlAbout" runat="server"></asp:Literal>
                            </div>
                            <br />
                            <br />

                            <h2>Location</h2>
                            <asp:Literal ID="ltrlLocation" runat="server"></asp:Literal>
                            <br />
                            <br />
                            <h2>Official website:</h2>
                            <asp:Label ID="lblWebsite" runat="server"></asp:Label>
                            <br />
                            <br />
                            <h2>Next Festival</h2>
                            <asp:Label ID="lblNextFestival" runat="server"></asp:Label>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>

        <div class="selection_main">
            <div class="container">
                <div class="content">
                    <h2>Official Selections</h2>

                    <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:Button ID="btnLoadMore" runat="server" OnClick="btnLoadMore_Click" Height="0" Width="0" BackColor="Transparent" BorderWidth="0" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="selections" runat="server" id="divtiles">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnLoadMore" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <footer class="bottom_bar">
            <div class="logo">
                <a href="Home.aspx">
                    <img src="../Content/images/logo.png" alt="" /></a>
                <div class="copyright">© <%= DateTime.Now.Year.ToString() %> Festpicks</div>
            </div>
            <div class="social">
                <ul>
                    <li><a href="#" class="face"></a></li>
                    <li><a href="https://twitter.com/festpicks" class="tweet" target="_blank"></a></li>
                    <li><a href="#" class="mail"></a></li>
                    <li><a href="#" class="google"></a></li>
                </ul>
            </div>
            <div class="links">
            <ul>
                <li><a href="SubmitYourFilm.aspx">Filmmakers</a></li>
                <li><a href="ContactUs.aspx">Contact Us</a></li>
                <li><a href="AboutUs.aspx">About Us </a></li>
                <li><a href="TermsOfUse.aspx">Terms of Use</a></li>
                <li><a href="PrivacyPolicy.aspx" >Privacy Policy</a></li>
                <li><a href="FAQ.aspx" >FAQ</a></li>
            </ul>
        </div>
        </footer>


        <script src="../Content/owl-carousel/jquery-1.9.1.min.js"></script>
        <script src="../Content/wow/wow.js"></script>
        <script src="../Content/js/common.js"></script>
        <script>
            $(document).ready(function (e) {
                $(window).scroll(function () {
                    var scrollVal = $(this).scrollTop();
                    
                    if (scrollVal > 145) {
                        $('.navigation').addClass("fixed");

                    } else {
                        $('.navigation').removeClass("fixed");

                    }
                    if ($(window).scrollTop() + 1 >= $(document).height() - $(window).height()) {
                        $("#<%=btnLoadMore.ClientID %>")[0].click();
                    }
            });
        });
        </script>
    </form>
</body>
</html>
