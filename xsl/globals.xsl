<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:file="http://expath.org/ns/file" 
  xmlns:xi="http://www.w3.org/2001/XInclude" 
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  xmlns:fct="factoton" 
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
  exclude-result-prefixes="#all" 
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:b>Factoton’ renderer globals</xd:b>
      <xd:p>Author: emchateau</xd:p>
      <xd:p>Since: 2024-06-11</xd:p>
    </xd:desc>
  </xd:doc>
  
  <xd:doc>
    <xd:desc>
      <xd:ref name="fct:xxx">xxx</xd:ref> is ...</xd:desc>
  </xd:doc>
  <xsl:variable name="fct:xxx" as="xs:string" select="'xxx'"/>
  
</xsl:stylesheet>