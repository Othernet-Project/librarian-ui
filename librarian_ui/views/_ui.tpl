<%namespace name="forms" file="_forms.tpl"/>

## Pulldown menubar
##
## Renders several containers representing pulldown menubars.
## 

<%def name="apps_menu(id)">
    <nav class="o-pulldown-menubar-menu o-collapsible" id="${id}-menu" role="menubar" aria-expanded="false">
    ${caller.body()}
    </nav>
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

<%def name="context_menu_item(id, label, url, icon, enabled)">
    <a href="${url if enabled else 'javascript:void(0);'}" id="${id}" class="o-context-menu-menuitem ${ 'disabled' if not enabled else ''}" role="menuitem" arial-disabled="${'false' if enabled else 'true'}">
        <span class="${'icon icon-{} '.format(icon) if icon else ''}o-context-menu-menuitem-icon"></span>
        <span class="o-context-menu-menuitem-label">${label}</span>
    </a>
</%def>

<%def name="context_menu_separator()">
    <span class="o-context-menu-separator"></span>
</%def>
