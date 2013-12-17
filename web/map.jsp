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
            #map-canvas { height: 100% }
        </style>
        <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDoQlexj60hARI0Y07hWkrG4pDE5dwUjY&sensor=false">
        </script>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <script type="text/javascript" src="js/MapLoading.js">


        </script>
        <%@ include file="include/head.jsp" %>

    </head>
    <body>
        <%@ include file="include/menu.jsp" %>

        <div class="row">
            <div class="col-md-8">        <div id="map-canvas"/>
            </div>
            <div class="col-md-4">.col-md-4</div>
        </div>

    </body>
</html>
