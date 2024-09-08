<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0" expand-text="true">
    <xsl:template name="layout">
        <xsl:param name="title"/>
        <html lang="fr-FR">
            <xsl:call-template name="head">
                <xsl:with-param name="title" select="$title"/>
            </xsl:call-template>
            <body>
                <xsl:call-template name="header"/>
                <xsl:apply-templates/>
                <xsl:call-template name="footer"/>
            <script><![CDATA[
    var apiURL = 'https://gallica.bnf.fr/iiif/';
    var bookID = 'ark:/12148/bpt6k1047050b/';
    ]]>
            </script>
            <script src="js/production.min.js?v=20221129"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>