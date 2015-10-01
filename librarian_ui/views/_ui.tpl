<%namespace name="forms" file="_forms.tpl"/>
## Contextbar
##
## Split panel with menu icon to the right and empty panel to the left.
##

<%def name="contextbar(id, label='open')">
    <div class="o-contextbar o-panel" id="${id}">
        <div class="o-panel">
        ${caller.panel()}
        </div>
        <div class="o-panel">
            <a href="#menu" class="o-contextbar-menu">
                <span class="o-contextbar-menu-label">${label}</span>
                <span class="o-contextbar-menu-icon icon"></span>
            </a>
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


## Multisearch
##
## Double-split panel with select list in the first panel, input box in second,
## and submit button in the last panel.
##

<%def name="multisearch(name, route_name=None, method='get', placeholder=None, label='go')">
    <form id="${name}" class="o-multisearch o-panel"${ 'action="{}"'.format(route(route_name)) if route_name else ''} method="${method}">
        <div class="o-panel">
            ${forms.select(name + '_mode')}
        </div>
        <div class="o-panel">
            ${forms.text(name + '_keywords', placeholder=placeholder)}
        </div>
        <div class="o-panel">
            <button id="${name}-button" type="submit" class="o-multisearch-button">
                <span class="o-multisearch-button-label">${label}</span>
                <span class="o-multisearch-button-icon icon"></span>
            </button>
        </div>
    </form>
</%def>
