<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Renderer is an other static web site generator from Factoton
    
    Factoton’s renderer is an other static site generator that leverages XML technologies to produce rich structured content. It relies on a simple file system organization, templates and configuration files to control the output. Renderer is specifically thought for digital critical editions but it is generic enough to be used in any context.
    
    @author emchateau
    @since 2024-06-10
    @licence GNU GPL v. 3
    
    @use This XSLT file uses initial-template, transformation use the `-it` parameter with
    `{http://www.w3.org/1999/XSL/Transform}initial-template` 
    @use This transformation uses EXPath file module, you should use Saxon PE or EE for transformation 
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:file="http://expath.org/ns/file" 
    xmlns:xi="http://www.w3.org/2001/XInclude" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fct="factoton" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="#all" 
    version="3.0">

    <xsl:output method="xhtml" html-version="5.0" include-content-type="no" omit-xml-declaration="yes" exclude-result-prefixes="#all" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:variable name="contentPath" select="'../../ouvroir/nucma/01-acquisition/article01.xml'"/>
    <xsl:variable name="buildPath" select="doc(file:base-dir() || 'config.xml')/fct:config/fct:build"/>

    <xsl:template name="xsl:initial-template">
        <xsl:value-of select="fct:generate(
            $contentPath,
            'xsl/' || 'tei2html.xsl')"/>
    </xsl:template>
    
    <xsl:function name="fct:generate" as="item()+">
        <xsl:param name="source" as="xs:string" />
        <xsl:param name="xsl" as="xs:string"/>
        <xsl:sequence select="transform(
            map{
            'stylesheet-location' : $xsl,
            'source-node' : doc($source)
            })"/>
    </xsl:function>

</xsl:stylesheet>