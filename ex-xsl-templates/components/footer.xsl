<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="true">
    <xsl:template name="footer">
        <xsl:param name="meta" as="map(*)"/>
        <xsl:param name="content" as="map(*)"/>
        
        <footer>
            <section>
                <h1>Contact</h1>
                <p>L’Encyclopédie des nouveaux usages des collections est une publication collective conçue dans le cadre de la recherche partenariale Des nouveaux usages des collections dans les musées d’art soutenue par le <a href="https://www.sshrc-crsh.gc.ca">Conseil de recherche en sciences humaines (CRSH)</a> du Canada.</p>
                <p>ISSN 444-003</p>
                <img src="images/cieco.svg" alt="logo du groupe de recherche CIÉCO"/>
                <p>L’<em class="title">Encyclopédie des nouveaux usages des collections</em> est une publication du groupe de recherche <a href="https://www.cieco.co">CIÉCO</a></p>
                <p>Courriel : <a href="mailto:coordination@cieco.co">coordination@cieco.co</a></p>
            </section>
            <section>
                <h1>Explorer</h1>
                <ol>
                    <li>Introduction</li>
                    <li>Aquisition</li>
                    <li>Documentation et restauration</li>
                    <li>Mise à vue</li>
                    <li>Médiation</li>
                    <li>Circulation</li>
                    <li>Restitutions et aliénations</li>
                </ol>
            </section>
            <section>
                <h1>Annexes</h1>
                <ul>
                    <li>Listes</li>
                    <li>Index</li>
                    <li>Bibliographie</li>
                    <li>À propos</li>
                </ul>
            </section>
            <section>
                <h1>Suivez-nous</h1>
                <ul>
                    <li><a href="">LinkedIn</a></li>
                    <li><a href="">Twitter/X</a></li>
                    <li><a href="">Facebook</a></li>
                </ul>
            </section>
        </footer>
    </xsl:template>
</xsl:stylesheet>