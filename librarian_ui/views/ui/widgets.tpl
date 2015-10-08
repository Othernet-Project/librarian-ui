<%namespace name="forms" file="_forms.tpl"/>

<%! jsvoid = 'javascript:void(0);' %>

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

<%def name="context_menu_item(id, label, url, icon='', enabled=True, direct=False, extra_attribs='')">
    <a 
        href="${url if enabled else jsvoid}" id="${id}" 
        class="o-context-menu-menuitem ${ 'disabled' if not enabled else ''}" 
        role="menuitem" 
        aria-disabled="${'false' if enabled else 'true'}"
        data-context="${'direct' if direct else 'modal'}"
        ${'tabindex="-1"' if not enabled else ''}
        ${extra_attribs}>
        <span class="${'icon icon-{} '.format(icon) if icon else ''}o-context-menu-menuitem-icon"></span>
        <span class="o-context-menu-menuitem-label">${label}</span>
    </a>
</%def>

<%def name="context_menu_submenu(id, target_id, label, icon='', expand_icon='chevron-right', enabled=True)">
    <a 
        href="${'#{}'.format(target_id) if enabled else jsvoid}" id="${id}" 
        class="o-context-menu-menuitem o-context-menu-submenu-activator ${ 'disabled' if not enabled else ''}" 
        role="menuitem" 
        aria-disabled="${'false' if enabled else 'true'}"
        aria-controls="${target_id}"
        data-direct="submenu">
        <span class="${'icon icon-{} '.format(icon) if icon else ''}o-context-menu-menuitem-icon"></span>
        <span class="o-context-menu-menuitem-label">${label}</span>
        <span class="o-context-menu-expand-icon icon icon-${expand_icon}"></span>
    </a>
</%def>

<%def name="context_menu_back(target_id, label, icon='arrow-left')">
    <a
        href="#${target_id}"
        class="o-context-menu-menuitem o-context-menu-back"
        role="menuitem"
        data-context="back">
        <span class="${'icon icon-{} '.format(icon) if icon else ''}o-context-menu-menuitem-icon"></span>
        <span class="o-context-menu-menuitem-label">${label}</span>
    </a>
</%def>

<%def name="context_menu_separator()">
    <span class="o-context-menu-separator"></span>
</%def>
