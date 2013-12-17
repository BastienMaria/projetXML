<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : SVGTab.xsl
    Created on : 17 décembre 2013, 10:49
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
                <title>SVGTab.xsl</title>
            </head>
            <body>
                <table>
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
