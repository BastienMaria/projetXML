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
            <!--            <div class="jumbotron">
                            <h1>Hello, world!</h1>
                            <p>This is an example to show the potential of an offcanvas layout pattern in Bootstrap. Try some responsive-range viewport sizes to see it in action.</p>
                        </div>-->
            <div class="page-header">
                <h1>Recherchez un hotel</h1>
                <p class="lead">Sélectionnez vos critères parmis les choix suivants puis validez</p>
            </div>
            <br>
            <form role="form" method="post" name="form">
                <div class="row">
                    <div class="col-xs-3">
                        <select class="form-control" name="languages">
                            <option>Anglais</option>
                            <option>Allemand</option>
                            <option>Espagnol</option>
                            <option>Italien</option>
                            <option>Russe</option>
                            <option>Français</option>
                            <option>Néerlandais</option>
                            <option>Arabe</option>
                            <option>Finois</option>
                            <option>Portugais</option>
                            <option>Lituanien</option>
                            <option>Japonais</option>
                            <option>Polonais</option>
                            <option>Danois</option>
                        </select>

                    </div>
                    <div class="col-xs-3">
                        <select class="form-control" name="payments">
                            <option>Visa</option>
                            <option>Master Card</option>
                            <option>American express</option>
                            <option>Diner's club</option>
                            <option>Chèques</option>
                            <option>Chèques Vacances</option>
                            <option>Espèces</option>
                            <option>Virements</option>
                            <option>Chèques de voyage</option>
                            <option>Carte de crédit</option>
                            <option>JCB</option>
                            <option>Mandats internationaux</option>
                            <option>Devises</option>
                            <option>Eurochèques</option>
                            <option>Bons CAF</option>
                            <option>Tickets restaurants</option>
                            <option>Union Pay</option>
                        </select>
                    </div>
                    <div class="col-xs-3">
                        <select class="form-control" name="amenities">
                            <option>Accès Internet</option>
                            <option>Ascenseur</option>
                            <option>Bar</option>
                            <option>Bibliothèque</option>
                            <option>Boutique</option>
                            <option>Garage privé</option>
                            <option>Jardin</option>
                            <option>Equipements pour enfants</option>
                            <option>Local matériel fermé</option>
                            <option>Parking privé</option>
                            <option>Parking public à proximité</option>
                            <option>Piscine</option>
                            <option>Restaurant</option>
                            <option>Salle de sport</option>
                            <option>Salon</option>
                            <option>Salon de télévision</option>
                            <option>Terrasse</option>
                            <option>Wifi</option>
                            <option>Accès Internet dans les chambres</option>
                            <option>Animaux acceptés</option>
                            <option>Blanchisserie</option>
                            <option>Bureau de change</option>
                            <option>Câble, satellite</option>
                            <option>Climatisation</option>
                            <option>Coffres clients</option>
                            <option>Double vitrage</option>
                            <option>Réservation de prestations</option>
                            <option>Service en chambre</option>
                            <option>Téléphone</option>
                            <option>Télévision</option>
                            <option>Veilleur de nuit</option>
                            <option>Voiturier</option>
                            <option>Accueil enfants</option>
                            <option>Menu Enfants</option>
                            <option>Salle de réunion</option>
                            <option>Chambres vue mer</option>
                            <option>Chambres communicantes / familiales</option>
                            <option>Piscine réservée à la clientèle</option>
                            <option>Equip. personnes handicapées</option>
                            <option>Toit-terrasse</option>
                            <option>Mini-bar</option>
                            <option>Ouvert 24h sur 24</option>
                            <option>Tarifs famille</option>
                            <option>Parc</option>
                            <option>Kitchenette</option>
                            <option>Plage privée</option>
                            <option>Jeux intérieurs pour enfants</option>
                            <option>Sauna</option>
                            <option>Spa</option>
                            <option>Jacuzzi</option>
                            <option>Massages</option>
                            <option>Cabine téléphonique, Point Phone</option>
                            <option>Terrasse privative</option>
                            <option>Hammam</option>
                            <option>Location de Vélo</option>
                            <option>Magnétoscope</option>
                        </select>
                    </div>
                </div>
                <br>
                <button type="button" class="btn btn-default" id="valid">Valider</button>
            </form>
            <div id="result" style="width : 100%;margin : auto" ></div>
        </div>
        <script>
            $("#valid").click(function() {
                var pay = document.form.payments.value;
                var lan = document.form.languages.value;
                var ser = document.form.amenities.value;
                $.post("http://localhost:8080/projetXML/Search", {pay: pay, lang: lan, serv: ser})
                        .done(function(data) {
                            $("#result").empty();
                            $("#result").append(data);
                        });
            });
        </script>

    </body>
</html>