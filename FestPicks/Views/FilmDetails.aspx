<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilmDetails.aspx.cs" Inherits="FestPicks.Views.FilmDetails" %>

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
        <div class="film_detail_main">
            <div class="container">

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

    <div class="film_details">
        <div class="container">
            <div class="content">
                <div class="thumb">
                    <div class="inner">
                        <img src="../Content/images/film.jpg" alt="" runat="server" id="movieposter" />
                    </div>
                </div>
                <div class="detail_content">
                    <div class="detail">

                        <h3>
                            <asp:Literal ID="ltrlTitle" runat="server"></asp:Literal></h3>
                        <p>
                            <strong>Released: </strong>
                            <asp:Literal ID="ltrlDate" runat="server"></asp:Literal><br>
                            <strong>Director: </strong>
                            <asp:Literal ID="ltrlDirector" runat="server"></asp:Literal><br>
                            <strong>Award: </strong>
                            <asp:Literal ID="ltrlAward" runat="server"></asp:Literal><br>
                            <strong>Festival: </strong>
                            <asp:Literal ID="ltrlFestival" runat="server"></asp:Literal><br>
                            <strong>Actors: </strong>
                            <asp:Literal ID="ltrlActors" runat="server"></asp:Literal>
                        </p>
                        <div class="time">
                            <i class="fa fa-clock-o"></i> RunTime:
                            <asp:Literal ID="ltrlRuntime" runat="server"></asp:Literal>
                        </div>
                    </div>

                    <h2>Description</h2>
                    <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce maximus libero a tempus faucibus. Phasellus sit amet consectetur mi. Nulla a vestibulum quam, in porta ante. Aliquam finibus est eleifend hendrerit fringilla. Vivamus a nisi quis neque tristique molestie. Pellentesque et sem sollicitudin, mattis nunc et, faucibus metus. Praesent scelerisque velit ac augue pulvinar, sit amet rhoncus nisi luctus. Praesent bibendum, tortor a placerat finibus, urna neque viverra leo, quis ultrices justo dolor sit amet orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam convallis sit amet augue ut lacinia. Nulla risus tortor, fringilla vel scelerisque in, volutpat ac elit. Sed dapibus ut dui eget condimentum. Nullam lacinia, purus nec ullamcorper dictum, orci risus sagittis nisl, sed lacinia ipsum quam a sapien. Sed vel efficitur velit, nec ultrices augue. </p>--%>
                    <asp:Literal ID="ltrlAbout" runat="server"></asp:Literal>
                    <br />
                    <br />
                    <h2>Location</h2>
                    <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce maximus libero a tempus faucibus. Phasellus sit amet consectetur mi. Nulla a vestibulum quam, in porta ante. Aliquam finibus est eleifend hendrerit fringilla. Vivamus a nisi quis neque tristique molestie. Pellentesque et sem sollicitudin, mattis nunc et, faucibus metus. Praesent scelerisque velit ac augue pulvinar, sit amet rhoncus nisi luctus. Praesent bibendum, tortor a placerat finibus, urna neque viverra leo, quis ultrices justo dolor sit amet orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Etiam convallis sit amet augue ut lacinia. Nulla risus tortor, fringilla vel scelerisque in, volutpat ac elit. Sed dapibus ut dui eget condimentum. Nullam lacinia, purus nec ullamcorper dictum, orci risus sagittis nisl, sed lacinia ipsum quam a sapien. Sed vel efficitur velit, nec ultrices augue. </p>--%>
                    <p><asp:Literal ID="ltrlLocation" runat="server"></asp:Literal></p>
                </div>


                <div class="video">
                    <%--<iframe width="100%" height="202" src="https://www.youtube.com/embed/E_Ci-pAL4eE" frameborder="0" allowfullscreen></iframe>--%>
                    <asp:Literal ID="youtube" runat="server"></asp:Literal>
                    <div class="button"><a runat="server" id="ancrwatchfilm" >WATCH FILM</a></div>
                </div>
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

                if (scrollVal > 64) {
                    $('.navigation').addClass("fixed");

                } else {
                    $('.navigation').removeClass("fixed");

                }
            });
        });
    </script>

</body>
</html>
