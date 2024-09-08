<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xi="http://www.w3.org/2001/XInclude" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fct="factoton"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="#all" 
    version="3.0"
    expand-text="true">
    <xsl:strip-space elements="*"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="processing-instruction() | comment()"/>
    
    
    <xsl:template match="text">
        <main class="article">
            <article>
                <header>
                    <toto></toto>
                    <xsl:value-of select="$description"/>
                    <xsl:apply-templates/>
                </header>
            </article>
            <xsl:apply-templates />
        </main>
    </xsl:template>
    
    <xsl:template match="front">
        <section>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="body">
        <section>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="back">
        <section>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="front/div | body/div | back/div">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="div">
        <div class="{@type}"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="p">
        <p data-p-id="{@xml:id}"><xsl:apply-templates/></p>
    </xsl:template>
    
    
</xsl:stylesheet>