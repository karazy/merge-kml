<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xpath-default-namespace="http://www.opengis.net/kml/2.2">

    <xsl:output method="xml"/>
    <xsl:param name="filename" select="'merged'"/>

    <xsl:template match="kml/Document">
        <xsl:copy-of select="*"/>
    </xsl:template>

    <xsl:template match="/">
        <xsl:variable name="time"><xsl:value-of  select="current-date()"/></xsl:variable>
        <xsl:result-document href="{$filename}.kml" method="xml">
            <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2">
                <Document>
                <xsl:for-each select="collection(iri-to-uri('./source/?select=*.kml'))">
                    <xsl:apply-templates></xsl:apply-templates>
                </xsl:for-each>
                </Document>
            </kml>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>

