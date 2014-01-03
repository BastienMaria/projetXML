<%--
    Document   : map
    Created on : 16 déc. 2013, 17:02:53
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
            #map-canvas { width: 500px;
                          height: 400px; }
            </style>
            <script type="text/javascript"
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDoQlexj60hARI0Y07hWkrG4pDE5dwUjY&sensor=false">
            </script>

            <script src="https://code.jquery.com/jquery-1.10.2.min.js">
            </script>

            <!--<script type="text/javascript" src="js/MapLoading.js">
            </script>
            -->

            <script type="text/javascript">
                var prev_infobulle;
                function setUpMarkers() {

                    if (window.XMLHttpRequest)
                    {// pour IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp = new XMLHttpRequest();
                    }
                    else
                    {// pour IE6, IE5
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    // on récupére tous les hotels qui ont long et lat et les photos s'il y a
                    xmlhttp.open("GET", "hotels_nom_long_lat_img.xml", false);
                    xmlhttp.send();

                    xmlDoc = xmlhttp.responseXML;
                    var x = xmlDoc.getElementsByTagName("Hotel");

                    for (i = 0; i < x.length; i++)
                    {
                        if (x[i].getElementsByTagName("latitude")[0] === 'undefined' || x[i].getElementsByTagName("longitude")[0] === 'undefined') {
                            console.log("problem de lat ou long");
                        }
                        else {
                            var Lat = x[i].getElementsByTagName("latitude")[0].childNodes[0].nodeValue;
                            var Long = x[i].getElementsByTagName("longitude")[0].childNodes[0].nodeValue;
                            var Name = x[i].getElementsByTagName("name_fr")[0].childNodes[0].nodeValue;
                        }

                        var myLatLong = new google.maps.LatLng(Lat, Long);
                        var infow = new google.maps.InfoWindow();
                        var marker = new google.maps.Marker({
                            position: myLatLong,
                            map: map,
                            title: Name
                        });

                        var text_infobulle;
                        x[i].getElementsByTagName("images").innerHTML = x[i].getElementsByTagName("images")[0].childNodes.length ? x[i].getElementsByTagName("images")[0].childNodes[1].childNodes[0].nodeValue : "photo non dispo";
                        if (x[i].getElementsByTagName("images").innerHTML === "photo non dispo") {
                            text_infobulle = "Photos non disponible"
                        } else {
                            text_infobulle = "<img src=\"" + x[i].getElementsByTagName("images").innerHTML + "\" alt=\"test\">";
                        }
                        setEventMarker(marker, infow, text_infobulle);
                    }
                }

                function setEventMarker(marker, infowindow, texte) {
                    google.maps.event.addListener(marker, 'click', function() {
                        // évite la superposition des infobulles
                        if (prev_infobulle)
                        {
                            prev_infobulle.close();
                        }
                        prev_infobulle = infowindow;
                        // affectation du texte
                        infowindow.setContent(texte);
                        // affichage InfoWindow
                        infowindow.open(this.getMap(), this);
                    });
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
                    google.maps.event.addDomListener(window, "resize", function() {
                        var center = map.getCenter();
                        google.maps.event.trigger(map, "resize");
                        map.setCenter(center);
                    });

                    setUpMarkers();
                }

                google.maps.event.addDomListener(window, 'load', initialize);
            </script>
        </head>
        <body>
            <div id="map-canvas"></div>
    </body>
</html>
