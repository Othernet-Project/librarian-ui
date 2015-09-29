## Pulldown menubar
##
## Renders several containers representing pulldown menubars.
## 

<%def name="pulldown_menubar(id)">
    <header class="o-pulldown-menubar" id="${id}">
    ${caller.body()}
    </header>
</%def>

<%def name="pulldown_menubar_menu(id)">
    <nav class="o-pulldown-menubar-menu" id="${id}-menu" role="navigation">
    ${caller.body()}
    </nav>
</%def>

<%def name="pulldown_menubar_hbar(id, label)">
    <div class="o-pulldown-menubar-hbar" id="${id}-hbar" role="menubar">
        <a href="#${id}-menu" role="button" class="o-pulldown-menubar-hbar-activator">
            <span class="o-pulldown-menubar-hbar-activator-label">${label}</span>
            <span class="o-pulldown-menubar-hbar-activator-icon icon"></span>
        </a>
        <div class="o-pulldown-menubar-hbar-bar">
            ${caller.body()}
        </div>
    </div>
</%def>

## Main panel
##
## Simple container that leaves space for pulldown menubar and status bar
##

<%def name="main_panel(id)">
    <div class="o-main-panel" id="${id}">
        ${caller.body()}
    </div>
</%def>


## Status bar (bottom bar)
##
## Retractable status bar
##

<%def name="statusbar(id)">
    <footer class="o-statusbar" id="${id}">
        ${caller.body()}
    </footer>
</%def>

<%def name="statusbar_hbar(id, label)">
    <div class="o-statusbar-hbar" id="${id}-hbar">
        <div class="o-statusbar-hbar-quick-status">
            ${caller.body()}
        </div>
        <a href="#${id}-status" class="o-statusbar-hbar-activator">
            <span class="o-statusbar-hbar-activator-label">${label}</span>
            <span class="o-statusbar-hbar-activator-icon icon"></span>
        </a>
    </div>
</%def>

<%def name="statusbar_status(id)">
    <div class="o-statusbar-status" id="${id}-status">
        ${caller.body()}
    </div>
</%def>
