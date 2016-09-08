<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitYourFilm.aspx.cs" Inherits="FestPicks.Views.SubmitYourFilm" %>

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
        <div class="form_main">
            <div class="container">
                <div class="submit_film">
                    <h2>Submit Your Film</h2>
                    <p>
                        Festpicks invites you to reach a global film-loving audience by submitting your film to our online film collection.  We offer an innovative streaming model with
                        <br>
                        the industry’s most generous revenue share.We limit films on our site to those that have been selected by at least one film festival.<br>
                        Provide us with your details and we will contact you to arrange transfer.
                    </p>
                    <div class="form">
                        <div class="form-field name">
                            <input type="text" class="textbox" placeholder="NAME">
                        </div>
                        <div class="form-field email">
                            <input type="text" class="textbox" placeholder="EMAIL">
                        </div>
                        <div class="form-field phone">
                            <input type="text" class="textbox" placeholder="PHONE NO.">
                        </div>
                        <div class="form-field title">
                            <input type="text" class="textbox" placeholder="FILM TITLE">
                        </div>
                        <div class="form-field year">
                            <input type="text" class="textbox" placeholder="YEAR">
                        </div>
                        <div class="form-field director">
                            <input type="text" class="textbox" placeholder="DIRECTOR NAME">
                        </div>
                        <div class="form-field festival">
                            <input type="text" class="textbox" placeholder="FILM FESTIVAL">
                        </div>
                        <div class="button">
                            <button class="submit">Submit</button>
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

    <div class="submit_film_content">
        <div class="container">
            <div class="content">
                <p>
                    Festpicks is proud to partner with FilmFreeway. FilmFreeway makes it easy to discover and submit to thousands of film festivals
and screenplay contests all around the world. Best of all, Film Freeway is always 100% free for filmmakers and writers.
                </p>
                <a href="https://filmfreeway.com/sign_up" target="_blank"><img src="../Content/images/submit.jpg" alt="img" /></a>
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
            });
        });
    </script>

</body>
</html>

