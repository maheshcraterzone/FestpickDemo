<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsOfUse.aspx.cs" Inherits="FestPicks.Views.TermsOfUse" %>

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

    <section class="banner_main">
        <div class="m_menu">
            <div class="menu">
                <img src="../Content/images/menu.png" alt="" />
            </div>
            <ul class="m_nav">
                <li><a href="ExploreFestival.aspx">EXPLORE FESTIVALS</a></li>
                <li><a href="WatchFilms.aspx">Watch Films</a></li>
                <!--<li><a href="SubmitYourFilm.aspx">SUBMIT YOUR FILM</a></li>
                        <li><a href="ContactUs.aspx">CONTACT US</a></li>-->
            </ul>
        </div>
        <div class="form_main">
            <nav class="navigation">
                <ul>
                    <li><a href="ExploreFestival.aspx">EXPLORE FESTIVALS</a></li>
                    <li><a href="WatchFilms.aspx">Watch Films</a></li>
                    <!--<li><a href="SubmitYourFilm.aspx">SUBMIT YOUR FILM</a></li>
                    <li><a href="ContactUs.aspx">CONTACT US</a></li>-->
                </ul>
            </nav>
            <div class="container">
                <div class="about_us">
                    <h2>Terms Of Use</h2>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                </div>
                
            </div>
        </div>
    </section>

   

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

