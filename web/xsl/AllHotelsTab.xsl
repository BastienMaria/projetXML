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
                            <td>ID</td>
                            <td>Phone</td>
                            <td>Label</td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="entries/entry">
                            <tr>
                                <td>
                                    <xsl:value-of select="name_fr"/>
                                </td>
                                <td>
                                    <xsl:value-of select="ID"/>
                                </td>
                                <td>
                                    <xsl:value-of select="phone"/>
                                </td>
                                <td>
                                    <xsl:value-of select="labels/label"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
