<%--
    Document   : map
    Created on : 16 déc. 2013, 17:02:53
    Author     : Bastien
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="include/head.jsp" %>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <style type="text/css">
            html { height: 100% }
            body { height: 100%; margin: 0; padding: 0 }
            #map-canvas { height: 85%;
                          width: 100%;
                          margin-top: 51px
            }
        </style>
        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDoQlexj60hARI0Y07hWkrG4pDE5dwUjY&sensor=false">
        </script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script language="JavaScript">
                    function setUpMarkers() {

                        if (window.XMLHttpRequest)
                        {// pour IE7+, Firefox, Chrome, Opera, Safari
                            xmlhttp = new XMLHttpRequest();
                        }
                        else
                        {// pour IE6, IE5
                            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        xmlhttp.open("GET", "hotels_nom_long_lat.xml", false);
                        xmlhttp.send();
                        xmlDoc = xmlhttp.responseXML;

                        var x = xmlDoc.getElementsByTagName("Hotel");
                        for (i = 0; i < x.length; i++)
                        {
                            var Lat = x[i].getElementsByTagName("latitude")[0].childNodes[0].nodeValue;
                            var Long = x[i].getElementsByTagName("longitude")[0].childNodes[0].nodeValue;
                            var Name = x[i].getElementsByTagName("name_fr")[0].childNodes[0].nodeValue;
                            var myLatLong = new google.maps.LatLng(Lat, Long);
                            var marker = new google.maps.Marker({
                                position: myLatLong,
                                map: map,
                                title: Name
                            });

                            // On crée une infobulle
                            var infowindow = new google.maps.InfoWindow({
                                maxWidth: 300,
                                // On définit la position d'origine de l'infoWindow (la position du marqueur)
                                position: myLatLong,
                                // On définit le texte à afficher dans l'infoWindow
                                content: "Bienvenue à l'hotel " + Name
                            });
                            // On ajoute un listener d'événement : on écoute le clic sur le marqueur
                            google.maps.event.addListener(marker, 'click', function() {
                                // Ouverture de l'infobulle
                                infowindow.open(map, marker);
                            });

                        }
                    }
        </script>
        <script type="text/javascript">
            var map;
            function initialize() {
                var myLatLong = new google.maps.LatLng(43.704, 7.2646);
                var mapOptions = {
                    center: myLatLong,
                    zoom: 13,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
                setUpMarkers();
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>
    <body>
        <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">XML Project</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Accueil</a></li>
                        <li><a href="allHotels.jsp">Tous les hotels</a></li>
                        <li class="active"><a href="map.jsp">Map</a></li>
                        <li><a href="graph.jsp">Graphiques</a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->

        <div id="map-canvas"></div>

    </body>
</html>
