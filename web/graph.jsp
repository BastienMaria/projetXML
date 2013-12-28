<%@page contentType="text/html" pageEncoding="windows-1252"%>
<html lang="en">
    <head>
        <%@ include file="include/head.jsp" %>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="css/demo.css"media="screen">
        <link rel="stylesheet" href="css/demo-print.css"media="print">
        <script src="js/raphael.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/pie.js"></script>
        <style media="screen">
            #holder {
                margin: -350px 0 0 -350px;
                width: 700px;
                height: 700px;
            }
        </style>
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
        <table>
            <tbody>
                <tr>
                    <th scope="row">Ruby</th>
                    <td>40%</td>
                </tr>
                <tr>
                    <th scope="row">JavaScript</th>
                    <td>26%</td>
                </tr>
                <tr>
                    <th scope="row">Shell</th>
                    <td>5%</td>
                </tr>
                <tr>
                    <th scope="row">Python</th>
                    <td>5%</td>
                </tr>
                <tr>
                    <th scope="row">PHP</th>
                    <td>4%</td>
                </tr>
                <tr>
                    <th scope="row">C</th>
                    <td>4%</td>
                </tr>
                <tr>
                    <th scope="row">Perl</th>
                    <td>3%</td>
                </tr>
                <tr>
                    <th scope="row">C++</th>
                    <td>2%</td>
                </tr>
                <tr>
                    <th scope="row">Java</th>
                    <td>2%</td>
                </tr>
                <tr>
                    <th scope="row">Objective-C</th>
                    <td>2%</td>
                </tr>
            </tbody>
        </table>
        <div id="holder"></div>

    </body>
</html>
