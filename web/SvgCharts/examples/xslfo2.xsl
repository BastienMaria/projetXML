<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:import href="../charts.xsl" />
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="portrait" page-height="30cm" page-width="21cm" margin="1cm">
                    <fo:region-body margin="1cm"/>

                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="portrait">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table table-layout="fixed" width="100%">
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <fo:table-body>
                            <fo:table-row height="297mm">
                                <fo:table-cell display-align="center">
                                    <fo:block font-size="18pt" font-family="verdana" color="red"
                                              space-before="5mm" space-after="5mm">
                                        W3Schools
</fo:block>
                                    <fo:block>
                                        <fo:instream-foreign-object>
                                            <xsl:call-template name="barChart">
                                                <xsl:with-param name="xData" select="/data/x"/>
                                                <xsl:with-param name="yData" select="/data/y"/>
                                                <xsl:with-param name="width" select="'30cm'"/>
                                                <xsl:with-param name="height" select="'25cm'"/>
                                            </xsl:call-template>
                                        </fo:instream-foreign-object>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
