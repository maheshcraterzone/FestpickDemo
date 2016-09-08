<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchFilms.aspx.cs" Inherits="FestPicks.Views.WatchFilms" %>

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
                    <li><a href="ExploreFestival.aspx">EXPLORE FESTIVALS</a></li>
                    <li><a href="WatchFilms.aspx" class="active">Watch Films</a></li>
                </ul>
            </div>
            <div class="form_main">
                <nav class="navigation">
                    <ul>
                        <li><a href="ExploreFestival.aspx">EXPLORE FESTIVALS</a></li>
                        <li><a href="WatchFilms.aspx" class="active">Watch Films</a></li>
                        <!--<li><a href="SubmitYourFilm.aspx">SUBMIT YOUR FILM</a></li>
                            <li><a href="ContactUs.aspx">CONTACT US</a></li>-->
                    </ul>
                </nav>

                <div class="container">
                    <div class="watch_form">
                        <%--<h2>Watch Films</h2>--%>
                        <div class="form">
                            <div class="form-field genre">
                                <label>Genre</label>
                                <div class="select_box">
                                    <asp:DropDownList ID="ddlGenre" runat="server">
                                        <asp:ListItem Text="Select Genre" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-field title">
                                <label>Title</label>
                                <asp:TextBox ID="txtboxTitle" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="form-field year">
                                <label>Year</label>
                                <asp:TextBox ID="txtboxYear" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="form-field director">
                                <label>Director Name</label>
                                <asp:TextBox ID="txtboxDirectorName" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="form-field actor">
                                <label>Actor Name</label>
                                <asp:TextBox ID="txtboxActorName" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="form-field film">
                                        <label>Film Festival</label>
                                        <div class="select_box">
                                            <asp:DropDownList ID="ddlFilmFestival" runat="server" OnSelectedIndexChanged="ddlFilmFestival_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="Select Festival" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-field award">
                                        <label>Award</label>
                                        <div class="select_box">
                                            <asp:DropDownList ID="ddlAward" runat="server">
                                                <asp:ListItem Text="Select Award" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlFilmFestival" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="button">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="submit" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="explore_map week ">
                <div class="explore_carousel">

                    <h2>Films of the week</h2>
                    <div class="owl-carousel" runat="server" id="divhighlightedmovie">
                        <%--<div class="item">
                            <img src="../content/images/explore1.jpg" alt="" />
                            
                        </div>
                        <div class="item">
                             <img src="../content/images/explore1.jpg" alt="" />                          
                        </div>
                        <div class="item">
                             <img src="../content/images/explore1.jpg" alt="" />
                            
                        </div>--%>
                    </div>
                </div>
            </div>


        </section>

        <div class="selection_main">
            <div class="container">
                <div class="content">
                    <h2>Films Matching Your Search</h2>
                    <asp:Button ID="btnLoadMore" runat="server" OnClick="btnLoadMore_Click" Height="0" Width="0" BackColor="Transparent" BorderWidth="0" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="selections" runat="server" id="dynamicdiv">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnLoadMore" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
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
                    <li><a href="PrivacyPolicy.aspx">Privacy Policy</a></li>
                    <li><a href="FAQ.aspx">FAQ</a></li>
                </ul>
            </div>
        </footer>


        <script src="../Content/owl-carousel/jquery-1.9.1.min.js"></script>
        <script src="../Content/wow/wow.js"></script>
        <script src="../Content/owl-carousel/owl.carousel.js"></script>
        <script src="../Content/js/common.js"></script>
        <script>
            $(document).ready(function (e) {
                $('.owl-carousel').owlCarousel({
                    loop: true,
                    margin: 69,
                    nav: true,
                    //pagination:false,
                    items: 3,
                    //responsiveClass:true,
                    responsive: {
                        0: {
                            items: 1,
                            nav: false,
                            margin: 10
                        },
                        600: {
                            items: 2,
                            margin: 50
                        },
                        1000: {
                            items: 3
                        }
                    }
                });

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
