<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : testXSL.xsl
    Created on : 5 décembre 2013, 15:02
    Author     : Bastien
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules
         syntax recommendation http://www.w3.org/TR/xslt
    -->
    <xsl:template match="/">
        <html>
            <head>
                <script type="text/javascript" language="javascript" src="js/DataTables/media/js/jquery.js"></script>
                <script type="text/javascript" language="javascript" src="js/DataTables/media/js/jquery.dataTables.js"></script>
                <script type="text/javascript" charset="utf-8">
                    $(document).ready(function() {
                    $('#example').dataTable();
                    } );
                </script>
                <script>
                    $( "#target" ).click(function() {
                    alert( "Handler for .click() called." );
                    });
                </script>

                <style type="text/css" title="currentStyle">
                    @import "js/DataTables/media/css/demo_page.css";
                    @import "js/DataTables/media/css/demo_table.css";
                </style>
            </head>
            <body>
                <table class="table table-hover" id="example">
                    <thead>
                        <tr bgcolor="#F0F0F0">
                            <td>Nom hotel</td>
                            <td>Téléphone</td>
                            <td>Adresse</td>
                            <td>Note</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="entries/entry">
                            <tr>
                                <td>
                                    <div id="target">
                                        <xsl:value-of select="name_fr"/>
                                    </div>
                                </td>
                                <td>
                                    <xsl:value-of select="phone"/>
                                </td>
                                <td>
                                    <xsl:value-of select="address/address_line1"/>
                                </td>
                                <td>
                                    <xsl:value-of select="standings_levels/standings_level"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
