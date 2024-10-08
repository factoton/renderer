<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="true">
    <xsl:template name="layout">
        <xsl:param name="meta" as="map(*)"/>
        <xsl:param name="content" as="map(*)"/>
        
        <html lang="fr-FR">
            <xsl:call-template name="head">
                <xsl:with-param name="meta" select="$meta" as="map(*)"/>
                <xsl:with-param name="content" select="$content" as="map(*)"/>
            </xsl:call-template>
            <body>
                <xsl:call-template name="header">
                    <xsl:with-param name="meta" select="$meta" as="map(*)"/>
                    <xsl:with-param name="content" select="$meta" as="map(*)"/>
                </xsl:call-template>
                
                <xsl:apply-templates/>
                
                <xsl:call-template name="footer">
                    <xsl:with-param name="meta" select="$meta" as="map(*)"/>
                    <xsl:with-param name="content" select="$content" as="map(*)"/>
                </xsl:call-template>
                <script><![CDATA[ 
                    let message;
                    message = 'Hello world!';
                ]]></script>
            <script src="js/production.min.js?v=20221129"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>