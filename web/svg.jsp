<%--
    Document   : svg
    Created on : 16 déc. 2013, 18:00:38
    Author     : Bastien
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" type="text/css" href="css/jquery.svg.css">
        <script type="text/javascript" src="js/svg/jquery.svg.js"></script>
        <script type="text/javascript" src="js/svg/jquery.svggraph.js"></script>
        <title>SVG Page</title>
    </head>
    <body>
        <%@ include file="include/menu.jsp" %>
        <div class="panel panel-default">
            <div class="panel-heading">Quelques graphiques générés à partir de SVG ...</div>
            <div class="panel-body">
                <svg width="100" height="100">
                <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
                </svg>
            </div>
        </div>
        <div id="svggraph"></div>
        <script>
            svg.line(10, 10, 90, 90,
                    {stroke: 'blue', strokeWidth: 2, class_: 'myline'});
        </script>
    </body>
</html>
