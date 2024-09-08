<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" expand-text="true">
    <xsl:template name="header">
        <header id="header" class="header" role="banner">
            <p class="header_logo f1-18">
                <a href="index.html" rel="home"
                >Des nouveaux usages des collections dans les musées d’art</a>
            </p>
            <p class="header_btn header_btn-nav f1-17">
                <button class="js-nav-open" type="button"
                aria-haspopup="true" aria-controls="primaryNav" aria-expanded="false">
                    <span class="icon-menu" />
                    <span>Menu</span>
                </button>
            </p>
            <nav id="primaryNav" class="header_nav nav" role="menu"
                aria-labelledby="primaryNavTitle">
                <div class="nav_inner">
                    <p id="primaryNavTitle" class="nav_title f1-17">Menu</p>
                    <p class="nav_close">
                        <button class="js-nav-close" type="button">
                            <span class="icon-clear" />
                            <span class="srOnly">Fermer le menu</span>
                        </button>
                    </p>
                    <ul class="nav_list f2-90">
                        <li role="none">
                            <a role="menuitem" href="actualites.php">Rubriques</a>
                        </li>
                        <li role="none">
                            <a role="menuitem" href="edition.php">Parcours</a>
                        </li>
                        <li role="none">
                            <a role="menuitem" href="lien-page.php">Index</a>
                        </li>
                        <li role="none">
                            <a role="menuitem" href="lien-page.php">Bibliographie</a>
                        </li>
                        <li role="none">
                            <a role="menuitem" href="lien-page.php">À Propos</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <p class="header_btn header_btn-settings f1-17">
                <button class="js-panel-toggle"
                type="button" aria-haspopup="dialog" aria-controls="settingsModal"
                aria-expanded="false">
                    <span class="icon-aa" />
                    <span class="srOnly">Ouvrir les réglages d’accessibilité</span>
                </button>
            </p>
            <p class="header_btn header_btn-search f1-17">
                <button class="js-panel-toggle"
                type="button" aria-haspopup="dialog" aria-controls="searchModal"
                aria-expanded="false">
                    <span class="icon-search" />
                    <span class="srOnly">Ouvrir la recherche</span>
                </button>
            </p>
            <div id="settingsModal" role="dialog" aria-modal="true"
                aria-labelledby="settingsModalTitle"
                class="header_panel header_panel-settings settings" aria-hidden="true">
                <button class="srOnly js-panel-close">Fermer les réglages d’accessibilité</button>
                <p id="settingsModalTitle" class="srOnly">Réglages d’accessibilité</p>
                <div class="settings_row">
                    <div class="settings_group" role="group"
                        aria-label="Adjuster la taille de texte">
                        <span class="settings_label f1-17" aria-hidden="true">Taille du texte</span>
                        <button class="settings_btn settings_btn-round js-settings-size-dec"
                            type="button">
                            <span class="icon-remove" />
                            <span class="srOnly">Diminuer la taille du texte</span>
                        </button>
                        <button class="settings_btn settings_btn-round js-settings-size-inc"
                            type="button">
                            <span class="icon-add" />
                            <span class="srOnly">Augmenter la taille du texte</span>
                        </button>
                    </div>
                </div>
                <div class="settings_row">
                    <fieldset class="settings_group">
                        <legend class="srOnly"
                            >Sélectionner le thème des couleurs pour la lecture</legend>
                        <span class="settings_label f1-17" aria-hidden="true">Thème</span>
                        <label class="settings_btn settings_btn-check">
                            <input name="color-theme-radios" type="radio" value="light" checked="" />
                            <span class="icon-check" />
                            <span class="srOnly">Clair</span>
                        </label>
                        <label class="settings_btn settings_btn-dark settings_btn-check">
                            <input name="color-theme-radios" type="radio" value="dark" />
                            <span class="icon-check" />
                            <span class="srOnly">Foncé</span>
                        </label>
                    </fieldset>
                </div>
                <div class="settings_row settings_row-dark">
                    <button class="settings_group settings_group-btn f1-17 js-settings-reset"
                        type="button">
                        <span class="icon-refresh" />
                        <span>Retour aux réglages par défaut</span>
                    </button>
                </div>
            </div>
            <div id="searchModal" role="dialog" aria-modal="true" aria-labelledby="searchModalTitle"
                class="header_panel header_panel-search search" aria-hidden="true">
                <button class="srOnly js-panel-close">Fermer la recherche</button>
                <p id="searchModalTitle" class="srOnly">Recherche</p>
                <div class="search_inner">
                    <form role="search" class="search_form f1-18">
                        <label for="search-query" class="srOnly">Entrer votre recherche</label>
                        <input type="text" id="search-query" placeholder="Rechercher ...." value=""
                            required="" />
                        <button type="submit">
                            <span class="icon-search" />
                            <span class="srOnly">Rechercher</span>
                        </button>
                    </form>
                    <div class="search_results" />
                </div>
            </div>
        </header>
    </xsl:template>
</xsl:stylesheet>
