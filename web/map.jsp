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
        <title>Map Page</title>
        <%@ include file="include/head.jsp" %>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <style type="text/css">
            html { height: 100% }
            body { height: 100%; margin: 0; padding: 0 }
            #map-canvas { margin-top: 50px;
                          width: 400px;
                          height: 580px; }
            </style>
            <script type="text/javascript"
                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDoQlexj60hARI0Y07hWkrG4pDE5dwUjY&sensor=false">
            </script>
            <!--<script src="https://code.jquery.com/jquery-1.10.2.min.js">
            </script>

            <script type="text/javascript" src="js/MapLoading.js">
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

                    xmlhttp.open("GET", "http://localhost:8080/projetXML/query", false);
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
                            var Id = x[i].getElementsByTagName("ID")[0].childNodes[0].nodeValue;
                        }

                        var myLatLong = new google.maps.LatLng(Lat, Long);
                        var stand = x[i].getElementsByTagName("standings_level")[0].childNodes[0].nodeValue;
                        var iconBase = 'img/';
                        switch (stand.charAt(0))
                        {
                            case "1":
                                iconBase = iconBase + '1etoiles.png';
                                break;
                            case "2":
                                iconBase = iconBase + '2etoiles.png';
                                break;
                            case "3":
                                iconBase = iconBase + '3etoiles.png';
                                break;
                            case "4":
                                iconBase = iconBase + '4etoiles.png';
                                break;
                            case "5":
                                iconBase = iconBase + '5etoiles.png';
                                break;
                            default :
                                iconBase = iconBase + '0etoiles.png';
                        }
                        var marker = new google.maps.Marker({
                            position: myLatLong,
                            map: map,
                            title: Name,
                            icon: iconBase
                        });

                        setEventMarker(marker, Id);
                    }
                }

                function setEventMarker(marker, Id) {
                    google.maps.event.addListener(marker, 'click', function() {
                        map.setCenter(marker.getPosition());
                        var infos = getUpInfos(Id);
                        var varBody = infos[0];
                        var varTitle = infos[1];

                        $('#infosTitle').empty();
                        $('#infosTitle').append(varTitle);
                        $('#infosBody').empty();
                        $('#infosBody').append(varBody);

                        $('#imageModal').modal('show');
                    });
                }
            </script>

            <script type="text/javascript">
                function getUpInfos(val) {
                    if (window.XMLHttpRequest)
                    {// pour IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttpi = new XMLHttpRequest();
                    }
                    else
                    {// pour IE6, IE5
                        xmlhttpi = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    // on récupére tous les hotels qui ont long et lat et les photos s'il y a

                    var urlComplet = "http://localhost:8080/projetXML/infos?hid=" + val;
                    xmlhttpi.open("GET", urlComplet, false);
                    xmlhttpi.send();
                    xmlInfos = xmlhttpi.responseXML;
                    var tel, email, site, img, lvl, name, nametitle, lvlnb, siteUrl;

                    lvl = xmlInfos.getElementsByTagName("standings_level")[0].childNodes[0].nodeValue;
                    switch (lvl.charAt(0))
                    {
                        case "1":
                            lvlnb = " *";
                            break;
                        case "2":
                            lvlnb = " **";
                            break;
                        case "3":
                            lvlnb = " ***";
                            break;
                        case "4":
                            lvlnb = " ****";
                            break;
                        case "5":
                            lvlnb = " *****";
                            break;
                        default :
                            lvlnb = "";
                    }
                    name = xmlInfos.getElementsByTagName("name_fr")[0].childNodes[0].nodeValue;
                    nametitle = xmlInfos.getElementsByTagName("name_fr")[0].childNodes[0].nodeValue + lvlnb;
                    if (xmlInfos.getElementsByTagName("email")[0].firstChild === null) {
                        email = "non renseigné";
                    } else {
                        email = xmlInfos.getElementsByTagName("email")[0].childNodes[0].nodeValue;
                    }
                    if (xmlInfos.getElementsByTagName("phone")[0].firstChild === null) {
                        tel = "non renseigné";
                    } else {
                        tel = xmlInfos.getElementsByTagName("phone")[0].childNodes[0].nodeValue;
                    }
                    if (xmlInfos.getElementsByTagName("website")[0].firstChild === null) {
                        site = "non renseigné (= recherche google ici !)";
                        siteUrl = "https://www.google.com/#q=" + name + " Nice";
                    } else {
                        site = xmlInfos.getElementsByTagName("website")[0].childNodes[0].nodeValue;
                        siteUrl = site;
                    }
                    if (xmlInfos.getElementsByTagName("image")[0].firstChild === null) {
                        img = "Photo non disponible";
                    } else {
                        img = xmlInfos.getElementsByTagName("image")[0].childNodes[0].nodeValue;
                    }

                    var retHtmlTitle = nametitle;
                    var retHtmlBody = "<p>Téléphone : " + tel + "</p><p>Email : " + email + "</p><p>Site : <a href=\"" + siteUrl + "\">" + site + "</a></p>\n\
                                        <p><img src=\"" + img + "\" width=\"540\" height=\"auto\"  />";

                    return[retHtmlBody, retHtmlTitle];
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
                        <li class="active" ><a href="map.jsp">Map</a></li>
                        <li><a href="graph.jsp">Graphiques</a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->
        <div class="row">
            <div style="width:100%" id="map-canvas"></div>
        </div>
        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="infosTitle"></h4>
                    </div>
                    <div class="modal-body">
                        <div id="infosBody"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
</html>
