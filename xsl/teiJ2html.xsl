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
    <xsl:output method="xhtml" html-version="5.0" include-content-type="no" omit-xml-declaration="yes" exclude-result-prefixes="#all" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:import href="components/layout.xsl"/>
    <xsl:import href="components/head.xsl"/>
    <xsl:import href="components/header.xsl"/>
    <xsl:import href="components/footer.xsl"/>
    
    <xd:doc>
        <xd:desc>jTEI2HTML5</xd:desc>
    </xd:doc>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> 17 septembre 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> emchateau</xd:p>
            <xd:p>a jTEI transformation. https://tei-c.org/release/doc/tei-p5-exemplars/html/tei_jtei.doc.html</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xhtml" html-version="5.0" include-content-type="no" omit-xml-declaration="yes" exclude-result-prefixes="#all" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />
    
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="processing-instruction() | comment()"/>
    
    <xsl:variable name="cssPath" select="'css/normalize.css', 'css/main.css'" />
    <xsl:variable name="jsPath" select="'js/script.js'" />
    
    <xsl:variable name="title" select="/TEI/teiHeader/fileDesc/titleStmt/title[@type='main']"/>
    <xsl:variable name="subTitle" select="/TEI/teiHeader/fileDesc/titleStmt/title[@type='sub']"/>
    <!-- @todo traiter les cas où pas de sstitre -->
    <xsl:variable name="authors" select="/TEI/teiHeader/fileDesc/titleStmt/author"/>
    <xsl:variable name="DOI" select="/TEI/teiHeader/fileDesc/publicationStmt/idno[@type='DOI']"/>
    
    <xsl:template match="/TEI">
        <!--<html lang="fr">
            <xsl:apply-templates select="teiHeader" />
            <body>
                <xsl:apply-templates select="text" />
            </body>
        </html>-->
        <xsl:call-template name="layout">
            <xsl:with-param name="title" select="$title"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <xsl:call-template name="head">
            <xsl:with-param name="title" select="$title"/>
        </xsl:call-template>
        
    </xsl:template>
    
    <xsl:template match="text">
        <main id="main" class="main" role="main">
            <article class="page">
                <header class="page_header pHeader">
                    <p class="pHeader_backlink f1-18"><a href="index.html"><span class="icon-arrow_back"></span> Section</a></p>
                    <h1 class="pHeader_title f2-90">{$title}</h1>
                    <p class="pHeader_st f2-36">{$subTitle}</p>
                    <p class="pHeader_infos f1-18">
                        <xsl:for-each select="$authors">
                            <a href="#" target="_blank">{string-join((./forename, ./surname), ' ')}</a>
                            </xsl:for-each>
                        <!-- @todo traiter multiples -->
                        <br/>
                        <xsl:text>DOI : </xsl:text>
                        <a href="#" target="_blank">{$DOI}</a></p>
                </header>
            </article>
            <section class="page_visuel">
                <img class="cv cv-img" src="img/maj.jpg" alt="Texte alternatif de l’image"/>
            </section>
            
            <xsl:apply-templates />
        </main>
    </xsl:template>
    
    <xsl:template match="front">
        <section class="page_abstract">
            <h2 class="page_abstractTitle f1-18">Résumé de l’article</h2>
            <div class="page_abstractText txt">
                <xsl:apply-templates select=".//div[@type='abstract']"/>
            </div>
        </section>
        
        <section class="page_nav">
            <ul class="f1-17">
                <li><a class="js-scroller" href="#biographie">Biographie des auteurs</a></li>
                <li><a class="js-scroller" href="#bibliographie">Bibliographie</a></li>
                <li><a class="js-scroller" href="#table-illustrations">Table des illustrations</a></li>
                <li><a class="js-scroller" href="#notes">Notes et références</a></li>
                <li><a class="js-scroller" href="#citer">Citer l’article</a></li>
                <li><a class="js-scroller" href="lien-fichier.epub">Télécharger (EPUB)</a></li>
            </ul>
        </section>
    </xsl:template>
    
    <xsl:template match="body">
        <section class="page_content page_content-center txt">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="back">
        <div class="page_infos">
            <section class="page_info js-acc infoBlock" id="notes">
                <h2 class="infoBlock_title f2-40">Notes et références</h2>
                <div class="infoBlock_content infoBlock_content-notes txt txt-cols txt-small">
                    <p><span id="note-1">1.</span> Claude-Nicolas Ledoux, <em>L’Architecture considérée sous le rapport de l’art, des mœurs et de la législation</em>, Paris, Perroneau, 1804, p. 22. Les citations dont la pagination sera désormais indiquée dans le corps du texte, sont toutes empruntées à cette édition originale. <a href="#note-anchor-1"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                    <p><span id="note-2">2.</span> Sur la Saline Royale, sa genèse, son chantier, ses enjeux, voir : Massounie, Dominique, La saline royale de Claude Nicolas Ledoux : Arc-et-Senans, Paris, Éditions du Patrimoine, Centre des monuments nationaux, 2016. <a href="#note-anchor-2"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                    <p><span id="note-3">3.</span> Jacques-François Blondel, Cours d’Architecture civile ou traité de la décoration, Distribution et Construction des bâtiments, contenant les Leçons données en 1750 et les années suivantes par J. F. Blondel, Architecte, dans son École des Arts, 6 vol., Paris, Desaint, 1771, vol. 2, p. 240 <a href="#note-anchor-3"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                    <p><span id="note-4">4.</span> Ibid., p. 229. <a href="#note-anchor-4"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                    <p><span id="note-5">5.</span> Werner Szambien, Symétrie, goût, caractère : théorie et terminologie de l’architecture à l’âge classique (1550-1800), Paris, Picard, 1986. <a href="#note-anchor-5"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                    <p><span id="note-6">6.</span> Johann Caspar Lavater, L’Art de connaître les hommes par la physionomie, Meudon, P.-S.-C. Demoilly, 1797. <a href="#note-anchor-6"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                    <p><span id="note-7">7.</span> « Le caractère d’architecture des différents peuples consiste dans une manière d’être, dans une conformation nécessitée par les besoins physiques et les habitudes morales, et dans laquelle se peignent les climats, les idées, les mœurs, les goûts, les plaisirs et le caractère même de chaque peuple ». (A. C. Quatremère de Quincy, Encyclopédie méthodique – Architecture, t. I, 1788, article « Caractère », p. 492). <a href="#note-anchor-7"><span class="icon-keyboard_return"></span><span class="srOnly">Retourner à la note dans le texte</span></a></p>
                </div>
            </section>
            <section class="page_info js-acc infoBlock" id="table-illustrations">
                <h2 class="infoBlock_title f2-40">Table des illustrations</h2>
                <div class="infoBlock_content infoBlock_content-illustrations">
                    <article class="row row-table">
                        <p class="row_cell row_cell-img"><img src="img/home.png" alt="Texte alternatif de l'image"/></p>
                        <div class="row_cell txt txt-small">
                            <table class="table">
                                <tr>
                                    <th scope="row">Titre</th>
                                    <td><strong>Figure 8</strong></td>
                                </tr>
                                <tr class="has-separator">
                                    <th scope="row">Légende</th>
                                    <td>Claude Chastillon, <em>Topographie francoise ou representations de plusieurs villes, bourgs, chasteaux, plans, forteresses, vestiges d’antiquité, maisons modernes et autres du royaume de France…</em>, 1655, fol. 57, NUM FOL EST 104.</td>
                                </tr>
                                <tr>
                                    <th scope="row">Crédits</th>
                                    <td>© Bibliothèque de l’Institut National d’Histoire de l’Art, collections Jacques Doucet, NUM FOL EST 104, <a href="#" target="_blank">https://bibliotheque-numerique.inha.fr/​viewer/​5750/​?offset=#page=57&amp;viewer=picture&amp;o=info&amp;n=0&amp;q=</a> [lien valide en décembre 2021].</td>
                                </tr>
                                <tr>
                                    <th scope="row">URL</th>
                                    <td><a href="#" target="_blank">http://journals.openedition.org/insitu/docannexe/image/33692/img-8.jpg</a></td>
                                </tr>
                                <tr>
                                    <th scope="row">Fichier</th>
                                    <td>image/jpeg, 382k</td>
                                </tr>
                            </table>
                        </div>
                    </article>
                    <article class="row row-table">
                        <p class="row_cell row_cell-img"><img src="img/home.png" alt="Texte alternatif de l'image"/></p>
                        <div class="row_cell txt txt-small">
                            <table class="table">
                                <tr>
                                    <th scope="row">Titre</th>
                                    <td><strong>Figure 10</strong></td>
                                </tr>
                                <tr class="has-separator">
                                    <th scope="row">Légende</th>
                                    <td>Abraham Bosse, <em>La Galerie du Palais</em>, estampe pour la comédie de Corneille La Galerie du Palais, XVIIe siècle, IFN-8403572.</td>
                                </tr>
                                <tr>
                                    <th scope="row">URL</th>
                                    <td><a href="#" target="_blank">http://journals.openedition.org/insitu/docannexe/image/33692/img-10.jpg</a></td>
                                </tr>
                                <tr>
                                    <th scope="row">Fichier</th>
                                    <td>image/jpeg, 412k</td>
                                </tr>
                            </table>
                        </div>
                    </article>
                </div>
            </section>
            <section class="page_info js-acc infoBlock" id="bibliographie">
                <h2 class="infoBlock_title f2-40">Bibliographie</h2>
                <div class="infoBlock_content infoBlock_content-bibliographie txt">
                    <p>Blondel, Jacques-François, Cours d’Architecture civile ou traité de la décoration, Distribution et Construction des bâtiments, contenant les Leçons données en 1750 et les années suivantes par J. F. Blondel, Architecte, dans son École des Arts, 6 vol. Paris, Desaint, 1771.</p>
                    <p>Ledoux, Claude-Nicolas, L’Architecture considérée sous le rapport de l’art, des mœurs et de la législation, Paris, 1804, rééd. Paris, Hermann, coll. « Savoirs sur l’art », 1997.</p>
                    <p>Rabreau, Daniel, Claude-Nicolas Ledoux (1736-1806), Bordeaux, Librairie de l’architecture et de la ville, 2000.</p>
                    <p>Vidler, Anthony, Claude-Nicolas Ledoux: Architecture and Social Reform at the End of the Ancien Régime, Cambridge (Mass.), MIT Press, 1990.</p>
                    <p>Vidler, Anthony, L’Espace des Lumières : Architecture et philosophie, trad. Catherine Fraisse, Paris, Picard, 1995.</p>
                </div>
            </section>
            <section class="page_info js-acc infoBlock" id="biographie">
                <h2 class="infoBlock_title f2-40">Biographie des auteurs</h2>
                <div class="infoBlock_content infoBlock_content-biographie">
                    <article class="row txt txt-simple">
                        <h3>Pierre Mounier</h3>
                        <p>Pierre Mounier, directeur-adjoint d’OpenEdition, est ingénieur de recherche à l’École des hautes études en sciences sociales. Ancien élève de l’ENS Ulm, il est aussi titulaire d'un master en anthropologie et sociologie comparative de l'université Paris-X Nanterre.</p>
                        <p>Orcid <a href="#" target="_blank">0000-0003-1638-3141</a></p>
                    </article>
                    <article class="row txt txt-simple">
                        <h3>Fabrice Moulin</h3>
                        <p>Fabrice Moulin est maître de conférences en littérature à l'université Paris-Nanterre. Ses recherches portent sur les liens entre littérature et esthétique. Il a obtenu en 2011 le prix de la Chancellerie des universités pour son mémoire de doctorat.</p>
                        <p>Orcid <a href="#" target="_blank">0000-0003-1638-3141</a></p>
                    </article>
                </div>
            </section>
            <section class="page_info js-acc infoBlock" id="citer">
                <h2 class="infoBlock_title f2-40">Citer cet article</h2>
                <div class="infoBlock_content infoBlock_content-citer">
                    <table class="table txt">
                        <tr class="has-separator">
                            <th scope="row">Chicago francisé</th>
                            <td>DURAND-MOREAU Quentin, LASFARGUES Gérard, Entre management et santé au travail, un dialogue impossible ? Érès, « Clinique du travail », 2022, ISBN : 9782749273747. URL : https://www.cairn.info/entre-management-et-sante-au-travail-un-dialogue-i--9782749273747.htm</td>
                        </tr>
                        <tr class="has-separator">
                            <th scope="row">ISO 690</th>
                            <td>Durand-Moreau, Quentin, et Gérard Lasfargues. Entre management et santé au travail, un dialogue impossible ? Érès, 2022</td>
                        </tr>
                        <tr class="has-separator">
                            <th scope="row">Export RIS</th>
                            <td>Durand-Moreau, Q. &amp; Lasfargues, G. (2022). Entre management et santé au travail, un dialogue impossible ?. Érès.</td>
                        </tr>
                        <tr class="has-separator">
                            <th scope="row">DOI</th>
                            <td><a href="#" target="_blank">10.4000/revuehn.2355 </a></td>
                        </tr>
                    </table>
                </div>
            </section>
            <section class="page_info infoBlock">
                <h2 class="srOnly">Fichier EPUB</h2>
                <p><a class="infoBlock_title f2-40" href="lien-fichier.epub">Télécharger au format EPUB</a></p>
            </section>
        </div>
    </xsl:template>
    
    <xsl:template match="front/div | body/div | back/div">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <xsl:template match="div">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <xsl:template match="epigraph">
        <div class="epigraph">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="p[not(parent::div[@type='abstract'])]">
        <p data-p-id="{position()}">
            <xsl:apply-templates />
        </p>
    </xsl:template>
    <xsl:template match="list">
        <xsl:choose>
            <xsl:when test="@type = 'ordered'">
                <ol>
                    <xsl:apply-templates />
                </ol>
            </xsl:when>
            <xsl:when test="@type = 'definition'">
                <dl>
                    <xsl:apply-templates mode="definition" />
                </dl>
            </xsl:when>
            <xsl:otherwise>
                <ul>
                    <xsl:apply-templates />
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="item">
        <li>
            <xsl:apply-templates />
        </li>
    </xsl:template>
    <xsl:template match="item" mode="definition">
        <dt>
            <xsl:apply-templates />
        </dt>
    </xsl:template>
    <xsl:template match="head">
        <xsl:variable name="level" select="count(ancestor::section | ancestor::div | ancestor::article)" />
        <xsl:variable name="name" select="concat('h', $level)" />
        <xsl:element name="{$name}">
            <xsl:apply-templates select="@* | node()" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="note">
        <div class="notes" id="{@xml:id}">
            <a href="{concat('#bn', @xml:id)}">
                <xsl:number count="note" level="any" />
                <xsl:text>. </xsl:text>
            </a>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ref">
        <a class="noteCall" href="{@target}" id="{concat('bn', substring-after(@target, '#'))}">
            <xsl:number count="ref" level="any" />
        </a>
    </xsl:template>
    
    <xsl:template match="ref[@type='link']">
        <!-- @todo check the doc -->
        <a class="noteCall" href="{@target}" id="{concat('bn', substring-after(@target, '#'))}">
            <xsl:number count="ref" level="any" />
        </a>
    </xsl:template>
    
    <xsl:template match="bibl">
        <div class="bibl">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="cit">
        <!-- @todo -->
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="figure">
        <!-- @todo -->
    </xsl:template>
    <xsl:template match="graphic">
        <!-- @todo -->
    </xsl:template>
    
    <xsl:template match="table">
        <!-- @todo -->
    </xsl:template>
    
    <xsl:template match="lb">
        <!-- @todo insert in schema -->
        <br />
    </xsl:template>
    
    <xsl:template match="ptr">
        <!-- @todo revoir -->
        <a class="ptr" href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>
    
    <!-- inline -->
    <xsl:template match="abbr">
        <abbr><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="att | gi | val | ident">
        <pre class="{local-name(.)}"><xsl:apply-templates/></pre>
    </xsl:template>
    <xsl:template match="code">
        <pre><xsl:apply-templates/></pre>
    </xsl:template>
    <xsl:template match="eg">
        <code class="xml"><xsl:apply-templates/></code>
    </xsl:template>
    <xsl:template match="egXML">
        <code><xsl:apply-templates/></code>
    </xsl:template>
    <xsl:template match="emph">
        <em class="emph">
            <xsl:apply-templates />
        </em>
    </xsl:template>
    <xsl:template match="foreign">
        <mark class="lang"><xsl:apply-templates/></mark>
    </xsl:template>
    <xsl:template match="gap">
        <gap>[...]</gap>
    </xsl:template>
    <xsl:template match="mentioned">
        <em class="mentioned"><xsl:apply-templates/></em>
    </xsl:template>
    <xsl:template match="q">
        <xsl:text>« </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> »</xsl:text>
    </xsl:template>
    <xsl:template match="p/quote">
        <xsl:text>« </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> »</xsl:text>
    </xsl:template>
    
    <!-- cit et ref -->
    <xsl:template match="quote">
        <blockquote>
            <xsl:apply-templates />
        </blockquote>
    </xsl:template>
    <!--<xsl:template match="ref">
    <a href="{@target}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>-->
    <xsl:template match="soCalled">
        <em class="soCalled">
            <xsl:apply-templates />
        </em>
    </xsl:template>
    <xsl:template match="supplied">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates />
        <xsl:text>]</xsl:text>
    </xsl:template>
    <xsl:template match="tag">
        <pre>
      <xsl:text>&lt;</xsl:text>
        <xsl:apply-templates></xsl:apply-templates>
      <xsl:text>&gt;</xsl:text>
    </pre>
    </xsl:template>
    <xsl:template match="term">
        <strong class="term"><xsl:apply-templates/></strong>
    </xsl:template>
    <xsl:template match="title">
        <xsl:choose>
            <xsl:when test="@level='a'">
                <xsl:text>« </xsl:text>
                <xsl:apply-templates/>
                <xsl:text> »</xsl:text>
            </xsl:when>
            <xsl:when test="@level='j'">
                <cite><xsl:apply-templates/></cite>
            </xsl:when>
            <xsl:otherwise><em class="title"><xsl:apply-templates/></em></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- legacy -->
    <xsl:template match="hi[@rend = 'italic']">
        <em>
            <xsl:apply-templates />
        </em>
    </xsl:template>
    <xsl:template match="hi[@rend = 'bold']">
        <strong>
            <xsl:apply-templates />
        </strong>
    </xsl:template>
    <xsl:template match="hi[@rend = 'superscript']">
        <!-- @todo insert in schema -->
        <sup>
            <xsl:apply-templates />
        </sup>
    </xsl:template>
    <xsl:template match="hi[@rend = 'underscript']">
        <!-- @todo insert in schema -->
        <sub>
            <xsl:apply-templates />
        </sub>
    </xsl:template>
    <xsl:template match="hi[@rend = 'smallcaps']">
        <!-- @todo insert in schema -->
        <span class="smallcaps">
            <xsl:apply-templates />
        </span>
    </xsl:template>
    <xsl:template match="del">
        <!-- @todo insert in schema -->
        <del>
            <xsl:apply-templates />
        </del>
    </xsl:template>
    <xsl:template match="label">
        <span class="label"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="persName | placeName | orgName | date | docAuthor">
        <!-- @todo insert in schema -->
        <span class="{local-name()}">
            <xsl:apply-templates />
        </span>
    </xsl:template>
    
    <!-- attributes -->
    <!--<xsl:template match="*">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="node()" />
    </xsl:element>
  </xsl:template>-->
    <xsl:template match="@xml:id">
        <xsl:attribute name="id">
            <xsl:value-of select="." />
        </xsl:attribute>
    </xsl:template>
    <!--
  <xsl:template match="@*">
    <xsl:copy />
  </xsl:template>-->
    
    
</xsl:stylesheet>