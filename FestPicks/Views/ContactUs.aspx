<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="FestPicks.Views.TermsOfUse" %>

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
                <div class="contact_us">
                    <div class="form">
                        <form>
                            <div class="form-field name">
                                <input type="text" class="textbox" placeholder="NAME">
                            </div>
                            <div class="form-field email">
                                <input type="text" class="textbox" placeholder="EMAIL">
                            </div>
                            <div class="form-field phone">
                                <input type="text" class="textbox" placeholder="PHONE NO.">
                            </div>
                            <div class="form-field msg">
                                <textarea class="textarea">Nature of Inquiry</textarea>
                            </div>

                            <div class="button">
                                <button class="submit">CONTACT ME</button>
                            </div>
                        </form>
                    </div>

                    <div class="address">
                        <h2>You can reach us here:</h2>
                        <h3>Address</h3>
                        <p>
                            22 King St. S. #300 Waterloo, Ontario, 
                    Canada N2J 1N8
                        </p>
                        <h3>Email</h3>
                        <p>info@festpicks.com</p>
                        <h3>Phone</h3>
                        <p>519-841-7922</p>
                    </div>

                </div>
                
            </div>
        </div>
    </section>

    <div class="location_map">
        <div class="container">
            <div class="content">
                <%--<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d48348.669221153265!2d-74.24918839187156!3d40.766603157307664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1462034125556" frameborder="0" style="border: 0" allowfullscreen></iframe>--%>
                <%--<iframe src="http://maps.stamen.com/watercolor/embed#17/43.46426/-80.52265"></iframe>--%>
                <div id="mapdiv" style="width: 100%; height: 300px"></div>
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
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.3.0"></script>
    <script type="text/javascript">
        function initialize() {
            var myCenter = new google.maps.LatLng(43.46426, -80.52265);
            var layer = "watercolor";
            var mapProp = {
                center: new google.maps.LatLng(43.46426, -80.52265),
                zoom: 17,
                mapTypeId: layer,
                mapTypeControl: false,
                mapTypeControlOptions: {
                    mapTypeIds: [layer]
                }
            };
            var map = new google.maps.Map(document.getElementById("mapdiv"), mapProp);
            map.mapTypes.set(layer, new google.maps.StamenMapType(layer));

            var infowindow = new google.maps.InfoWindow();

            var marker = new google.maps.Marker({
                position: myCenter,
            });

            marker.setMap(map);
            var infowindow = new google.maps.InfoWindow({
                content: "22 King St. S. #300 Waterloo, Ontario,Canada N2J 1N8"
            });
            marker.addListener('mouseover', function () {
                infowindow.open(map, marker);
            });

            marker.addListener('mouseout', function () {
                infowindow.close();
            });
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
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

