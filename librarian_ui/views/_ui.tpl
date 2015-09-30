## Split container
##
## Container that has two sections horizontally, of which one is fixed width,
## and other extends to fill the remaining space.

<%def name="split_container(id, fixed='back')">
    <div class="o-split-container o-split-container-fixed-#{fixed}">
        <div class="o-split-container-front">
            ${caller.front()}
        </div>
        <div class="o-split-container-back">
            ${caller.back()}
        </div>
    </div>
</%def>

## Pulldown menubar
##
## Renders several containers representing pulldown menubars.
## 

<%def name="pulldown_menubar(id, label='open/close')">
    <header class="o-pulldown-menubar" id="${id}" role="section">
        <nav class="o-pulldown-menubar-menu o-collapsible" id="${id}-menu" role="menubar" aria-expanded="false">
        ${caller.menu()}
        </nav>
        <div class="o-pulldown-menubar-hbar" id="${id}-hbar" role="menubar">
            <a href="#${id}-menu" role="button" aria-controls="${id}" class="o-pulldown-menubar-hbar-activator o-activator">
                <span class="o-pulldown-menubar-hbar-activator-label">${label}</span>
                <span class="o-pulldown-menubar-hbar-activator-icon icon"></span>
            </a>
            <div class="o-pulldown-menubar-hbar-bar">
                ${caller.hbar()}
            </div>
        </div>
    </header>
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

<%def name="statusbar(id, label='open/close')">
    <footer class="o-statusbar" id="${id}">
        <div class="o-statusbar-hbar o-activator" id="${id}-hbar" role="button" aria-controls="${id}-status">
            <div class="o-statusbar-hbar-quick-status">
                ${caller.hbar()}
            </div>
            <a href="#${id}-status" class="o-statusbar-hbar-activator" role="button" aria-controls="${id}-status">
                <span class="o-statusbar-hbar-activator-label">${label}</span>
                <span class="o-statusbar-hbar-activator-icon icon"></span>
            </a>
        </div>
        <div class="o-statusbar-status o-collapsible" id="${id}-status" role="status" aria-expanded="false">
            ${caller.status()}
        </div>
    </footer>
</%def>
