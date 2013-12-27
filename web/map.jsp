<%--
    Document   : map
    Created on : 16 d�c. 2013, 17:02:53
    Author     : Bastien
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <style type="text/css">
            html { height: 100% }
            body { height: 100%; margin: 0; padding: 0 }
            #map-canvas { height: 100% }
        </style>
        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDoQlexj60hARI0Y07hWkrG4pDE5dwUjY&sensor=false">
        </script>

        <script src="https://code.jquery.com/jquery-1.10.2.min.js">
        </script>

        <!--<script type="text/javascript" src="js/MapLoading.js">
        </script>
        -->

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

                    // On cr�e une infobulle
                    var infowindow = new google.maps.InfoWindow({
                        maxWidth: 300,
                        // On d�finit la position d'origine de l'infoWindow (la position du marqueur) 
                        position: myLatLong,
                        // On d�finit le texte � afficher dans l'infoWindow
                        content: "Bienvenue � l'hotel " + Name
                    });
                    // On ajoute un listener d'�v�nement : on �coute le clic sur le marqueur
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
        <div id="map-canvas"></div>
    </body>
</html>
