<%--
    Document   : allHotels
    Created on : 14 déc. 2013, 18:49:20
    Author     : Bastien
--%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <%@ include file="include/head.jsp" %>

    </head>
    <body>
        <%@ include file="include/menu.jsp" %>

        <script type="text/javascript">
            $(document).ready(function() {
                var html;
                $.get("http://localhost:8080/projet_XML/XSLT", function(data) {
                    html = data;
                    $(".errorMssg").text("Data Loaded: " + data);
                    //alert(html);
                    $("#tabAll").append(html);
                });
            });
        </script>
        <div id="tabAll"></div>
    </body>
</html>
