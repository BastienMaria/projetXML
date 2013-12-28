<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : CoordonneesXSL.xsl
    Created on : 19 décembre 2013, 15:27
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
                <title>CoordonneesXSL.xsl</title>
            </head>
            <body>
                <xsl:for-each select="Hotel">

                    <xsl:value-of select="longitude"/>

                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
