<?xml version="1.0" encoding="UTF-8"?>
<!-- Trying to create a collection element with the xml files to use them later-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:file="http://expath.org/ns/file" 
    xmlns:xi="http://www.w3.org/2001/XInclude" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fct="factoton"
    xmlns="factoton"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="#all" 
    version="3.0">
    <xsl:mode on-no-match="shallow-copy" />

    <xsl:output method="xml" include-content-type="no" exclude-result-prefixes="#all" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    

    <!--<xsl:variable name="file" select="doc('/Users/flsh/OneDrive/ProjetEncyclopedie/encyclopedie/prototype/xsl/config.xml')"/>-->
   <!-- <xsl:variable name="buildPath" select="doc(file:base-dir() || 'config.xml')/fct:config/fct:build"/>-->

   <!-- @rmq fn:collection() doesn’t consider file hierarchy -->
<xsl:variable name="folder" select="collection('../xml?recurse=yes;select=*.xml')"/>
<xsl:variable name="collection">
    <collection>
      <xsl:for-each select="$folder">
         <doc>
         <xsl:attribute name="href" select="base-uri(.)"/>
         </doc>
     </xsl:for-each>
     </collection>
</xsl:variable>

<xsl:template match="/">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="fct:collection">
    <xsl:copy-of select="$collection"/>
</xsl:template>


<!--<xsl:template name="xsl:initial-template">
 
</xsl:template>-->

</xsl:stylesheet>
