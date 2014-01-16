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
                    <fo:block font-style="normal"
                              font-weight="bold"
                              text-align="center"
                              color="#880000"
                              font-size="25pt"
                              background-color="#C0C0C0">

                        Répartition des moyens de paiement

                    </fo:block>
                    <fo:block padding-after="80pt"></fo:block>


                    <fo:block>
                        <fo:instream-foreign-object>
                            <xsl:call-template name="barChart">
                                <xsl:with-param name="xData" select="/data/x"/>
                                <xsl:with-param name="yData" select="/data/y"/>
                                <xsl:with-param name="width" select="'25cm'"/>
                                <xsl:with-param name="height" select="'20cm'"/>
                            </xsl:call-template>
                        </fo:instream-foreign-object>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
