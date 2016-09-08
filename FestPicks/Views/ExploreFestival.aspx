<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExploreFestival.aspx.cs" Inherits="FestPicks.Views.ExploreFestival" %>

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
                    <li><a href="ExploreFestival.aspx" class="active">EXPLORE FESTIVALS</a></li>
                    <li><a href="WatchFilms.aspx">Watch Films</a></li>
                    <!--<li><a href="SubmitYourFilm.aspx">SUBMIT YOUR FILM</a></li>
                        <li><a href="ContactUs.aspx">CONTACT US</a></li>-->
                </ul>
            </div>
            <div class="explore explore_map">
                <div class="container">
                    <nav class="navigation">
                        <ul>
                            <li><a href="ExploreFestival.aspx" class="active">EXPLORE FESTIVALS</a></li>
                            <li><a href="WatchFilms.aspx">Watch Films</a></li>
                            <!--<li><a href="SubmitYourFilm.aspx">SUBMIT YOUR FILM</a></li>
                            <li><a href="ContactUs.aspx">CONTACT US</a></li>-->
                        </ul>
                    </nav>

                    <div class="explore_form">
                        <%--<h2>Watch Films</h2>--%>
                        <div class="form">
                            <div class="form-field genre">
                                <label>City </label>
                                <asp:TextBox ID="txtboxCity" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="form-field title">
                                <label>Country </label>
                                <asp:TextBox ID="txtboxCountry" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="form-field year">
                                <label>Region </label>
                                <asp:DropDownList ID="ddlRegion" runat="server" CssClass="textbox">
                                    <asp:ListItem Text="Select Region" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-field director">
                                <label>Month </label>
                                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="textbox">
                                    <asp:ListItem Text="Select Month" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-field actor">
                                <label>Name</label>
                                <asp:TextBox ID="txtboxName" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>

                            <div class="button">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="submit" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>


                <div class="container">

                    <div class="explore_carousel">

                        <h2>Current & Upcoming Festivals</h2>
                        <div class="owl-carousel" runat="server" id="divbanner">
                            <%--<div class="item">
                            <img src="../images/explore1.jpg" alt="" />
                            <div class="title">May 11 –22  2016</div>
                        </div>
                        <div class="item">
                            <img src="../images/explore2.jpg" alt="" />
                            <div class="title">May 11 –22  2016</div>
                        </div>
                        <div class="item">
                            <img src="../images/explore3.jpg" alt="" />
                            <div class="title">May 11 –22  2016</div>
                        </div>--%>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <div class="map_main">
            <div class="container">
                <div class="content">
                    <h2>Film Festivals of the World</h2>
                    <%--<asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>--%>
                            <div id="map" style="width: 100%; height: 486px;"></div>
                        <%--</ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
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
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.3.0"></script>
        <script type="text/javascript">
            function initialize() {
                var locations = [
                <asp:Repeater ID="rptMarkers" runat="server">
                <ItemTemplate>
                [
                '<%# Eval("Id") %>',
                '<%# Eval("Lat") %>',
                '<%# Eval("Long") %>',
                '<%# Eval("FestivalName") %>',
                '<%# Eval("Country") %>',
                '<%# Eval("FestUrl") %>'
                ]
                </ItemTemplate>
                <SeparatorTemplate>
                    ,
                </SeparatorTemplate>
                </asp:Repeater>
            ];                
                var layer = "watercolor";
                var mapProp = {
                    center: new google.maps.LatLng(43.64763800, -79.39031100),
                    zoom: 2,
                    mapTypeId: layer,     
                    mapTypeControl:false,
                    mapTypeControlOptions: {
                        mapTypeIds: [layer]
                    }
                
                };
                var map = new google.maps.Map(document.getElementById("map"), mapProp);
                map.mapTypes.set(layer, new google.maps.StamenMapType(layer));
                
                var infowindow = new google.maps.InfoWindow();

                var marker, i;

                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                        map: map
                    });
                    google.maps.event.addListener(marker, 'mouseover', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][3]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));

                    marker.addListener('mouseout', function () {
                        infowindow.close();
                    });
                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            var Id = locations[i][0];
                            var url = locations[i][5];

                            if(url == "")
                                window.open("../Views/FestivalDetails.aspx?Id=","_self");
                            else
                                window.open("../Views/FestivalDetails.aspx?Id=" + Id,"_self");
                        }
                    })(marker, i));
                }
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
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
                $(window).scroll(function() {
                    var scrollVal = $(this).scrollTop();
				
                    if( scrollVal > 145) {				
                        $('.navigation').addClass( "fixed");	
					
                    } else {
                        $('.navigation').removeClass( "fixed");	
					
                    }
                });
            });
        </script>
    </form>
</body>
</html>
