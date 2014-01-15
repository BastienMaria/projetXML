<%@page contentType="text/html" pageEncoding="windows-1252"%>
<html lang="en">
    <head>
        <%@ include file="include/head.jsp" %>
        <meta charset="utf-8">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                var svg;
                $.get("http://localhost:8080/projetXML/tab?param=tabChambres", function(data) {
                    svg = data;
                    $(".errorMssg").text("Data Loaded: " + data);
                    $("#tabChambres").append(svg);
                });
                $(function() {
                    $("#tabs").tabs();
                });
            });
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
                        <li><a href="map.jsp">Map</a></li>
                        <li class="active"><a href="graph.jsp">Graphiques</a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->
        <div class="container">
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Standing</a></li>
                    <li><a href="#tabs-2">Payments</a></li>
                </ul>
                <div id="tabs-1">
                    <div id="tabChambres"></div>
                    <object type="image/svg+xml" data="http://localhost:8080/projetXML/pieChart"></object>
                    <a href="http://localhost:8080/projetXML/pdf1"><button type="button" class="btn btn-primary btn-lg">Générer PDF</button></a>
                </div>
                <div id="tabs-2">
                    <object type="image/svg+xml" data="http://localhost:8080/projetXML/bar"></object>
                    <a href="http://localhost:8080/projetXML/pdf2"><button type="button" class="btn btn-primary btn-lg">Générer PDF</button></a>                </div>
            </div>
        </div>
    </body>
</html>
