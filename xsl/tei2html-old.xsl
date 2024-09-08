<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xi="http://www.w3.org/2001/XInclude" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fct="factoton"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="#all" 
    version="3.0"
    expand-text="true">
    <!--<xsl:output method="xhtml" html-version="5.0" include-content-type="no" omit-xml-declaration="yes" exclude-result-prefixes="#all" encoding="UTF-8" indent="yes"/>
    --><xsl:strip-space elements="*"/>
    
    <!-- lib importation -->
    <!--<xsl:import href="lib/article2html.xsl"/>-->
    
    <!-- components importation -->
    <xsl:import href="../components/layout.xsl"/>
    <xsl:import href="../components/head.xsl"/>
    <xsl:import href="../components/header.xsl"/>
    <xsl:import href="../components/footer.xsl"/>
    
    <xsl:output method="xhtml" html-version="5.0" include-content-type="no" omit-xml-declaration="yes" exclude-result-prefixes="#all" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />
    
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="processing-instruction() | comment()"/>
    
    <!-- @todo path should be created dynamically -->
    <xsl:variable name="cssPath" select="'css/normalize.css', 'css/main.css'" />
    <xsl:variable name="jsPath" select="'js/script.js'" />
    
    <!-- @todo deal with title, description and meta with a function for different file types -->
    <xsl:variable name="meta" select="map{
        'title' : 'Test de titre',
        'description' : '',
        'authors' : ''
        }"/>
    
    <xsl:template match="/TEI">
        <xsl:call-template name="layout">
            <xsl:with-param name="meta" select="$meta"/>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>