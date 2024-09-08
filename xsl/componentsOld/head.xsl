<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="true">
    <xsl:template name="head">
        <xsl:param name="title" />
        <head>
            <meta charset="UTF-8" />
            <title>{$title}</title>
            <meta name="description" content="Description de la page" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta name="format-detection" content="telephone=no" />

            <link rel="stylesheet" href="css/style.css" />

            <!-- Google analytics ou autres outils d'analytics -->

            <!-- Favicon & mobiles icons (http://realfavicongenerator.net/) -->
        </head>
        <head>
            <meta charset="UTF-8" />
            <title>Encyclopédie des nouveaux usages des collections dans les musées d’art | {$title}</title>
            <meta name="description" content="Description de la page" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta name="format-detection" content="telephone=no" />

            <link rel="stylesheet" href="style.css?v=20221128" />

            <!-- Google analytics ou autres outils d'analytics -->

            <link rel="apple-touch-icon" sizes="180x180" href="img/favicon/apple-touch-icon.png" />
            <link rel="icon" type="image/png" sizes="32x32" href="img/favicon/favicon-32x32.png" />
            <link rel="icon" type="image/png" sizes="16x16" href="img/favicon/favicon-16x16.png" />
            <link rel="manifest" href="img/favicon/site.webmanifest" />
            <link rel="mask-icon" href="img/favicon/safari-pinned-tab.svg" color="#555555" />
            <meta name="msapplication-TileColor" content="#ffffff" />
            <meta name="theme-color" content="#ffffff" />
        </head>
    </xsl:template>
</xsl:stylesheet>
