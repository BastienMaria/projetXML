<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <%@ include file="include/head.jsp" %>
        <script type="text/javascript">
            $(document).ready(function() {
                var html;
                $.get("http://localhost:8080/projetXML/XSLT", function(data) {
                    html = data;
                    $(".errorMssg").text("Data Loaded: " + data);
                    $("#tabAll").append(html);
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
                        <li class="active"><a href="allHotels.jsp">Tous les hotels</a></li>
                        <li><a href="map.jsp">Map</a></li>
                        <li><a href="graph.jsp">Graphiques</a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->
        <div style="width:85%" class="container" id="tabAll"></div>

    </body>
</html>
