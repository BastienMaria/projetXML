<%--
    Document   : index
    Created on : 12 déc. 2013, 14:04:45
    Author     : Bastien
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="include/head.jsp" %>
    </head>
    <body>
        <%@ include file="include/menu.jsp" %>
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


                    <!--                    <div id="star"></div>-->

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




        </div> <!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->


    </body>
</html>

