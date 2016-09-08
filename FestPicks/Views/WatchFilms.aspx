<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WatchFilms.aspx.cs" Inherits="FestPicks.Views.WatchFilms" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Festpicks</title>
    <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1' />
    <link rel="shortcut icon" type="image/x-icon" href="../Content/images/favicon.ico" />
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
                    <li><a href="ExploreFestival">EXPLORE FESTIVALS</a></li>
                    <li><a href="WatchFilms">Watch Films</a></li>
                    <li><a href="SubmitYourFilm">SUBMIT YOUR FILM</a></li>
                    <li><a href="ContactUs">CONTACT US</a></li>
                </ul>
            </div>
            <div class="form_main">
                <div class="container">
                    <div class="watch_form">
                        <h2>Watch Films</h2>
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
                            <div class="button">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="submit" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                    <nav class="navigation">
                        <ul>
                            <li><a href="ExploreFestival">EXPLORE FESTIVALS</a></li>
                            <li><a href="WatchFilms">Watch Films</a></li>
                            <li><a href="SubmitYourFilm">SUBMIT YOUR FILM</a></li>
                            <li><a href="ContactUs">CONTACT US</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </section>

        <div class="selection_main">
            <div class="container">
                <div class="content">
                    <h2>Films Matching Your Search</h2>
                    <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:Button ID="btnLoadMore" runat="server" OnClick="btnLoadMore_Click" Height="0" Width="0" BackColor="White" BorderWidth="0" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="selections" runat="server" id="dynamicdiv">
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
                <a href="Home">
                    <img src="../Content/images/logo.png" alt="" /></a>
            </div>
            <div class="social">
                <ul>
                    <li><a href="#" class="face"></a></li>
                    <li><a href="https://twitter.com/festpicks" class="tweet" target="_blank"></a></li>
                    <li><a href="#" class="mail"></a></li>
                    <li><a href="#" class="google"></a></li>
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

                    if (scrollVal > 464) {
                        $('.navigation').addClass("fixed");

                    } else {
                        $('.navigation').removeClass("fixed");

                    }
                    if ($(window).scrollTop() + $(window).height() == $(document).height()) {
                        $("#<%=btnLoadMore.ClientID %>")[0].click();
                    }
                });
            });
        </script>

    </form>
</body>
</html>
