<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="include/head.jsp" %>
        <script src="bootstrap/js/bootstrap.min.js"></script>

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
                        <li class="active"><a href="index.jsp">Accueil</a></li>
                        <li><a href="allHotels.jsp">Tous les hotels</a></li>
                        <li><a href="map.jsp">Map</a></li>
                        <li><a href="graph.jsp">Graphiques</a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->

        <div class="container">

            <div class="page-header">
                <h1>Recherchez un hotel</h1>
                <p class="lead">Sélectionnez vos critères parmis les choix suivants puis validez</p>
            </div>

            <br>

            <form role="form" action ="Search" method="post">
                <div class="row">
                    <div class="col-xs-3">
                        <select class="form-control" name="payments">
                            <option>Visa</option>
                            <option>Espéces</option>
                            <option>Master Card</option>
                        </select>
                    </div>
                    <div class="col-xs-3">
                        <select class="form-control" name="languages">
                            <option>Anglais</option>
                            <option>Allemand</option>
                            <option>Espagnol</option>
                            <option>Italien</option>
                        </select>
                    </div>
                    <div class="col-xs-3">
                        <select class="form-control" name="amenities">
                            <option>Ascenseur</option>
                            <option>BibliothÃ¨que</option>
                            <option>Restaurant</option>
                            <option>Wifi</option>
                            <option>Piscine</option>
                        </select>
                    </div>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>   <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>   <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>   <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <br>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>

        </div>
    </body>
</html>

