<%doc>
The menu items must follow the librarian-menu API. The def in this module is 
expected to receive a ``librarian_menu.menu.MenuItem`` object as its only 
argument.
</%doc>

<%def name="menu_item(obj)">
    % if obj.is_visible():
        <li class="o-apps-menu-item" id="${obj.name}">
        % if obj.icon_is_bitmap:
            <span class="o-apps-menu-icon o-apps-menu-icon-bitmap">
                <img src="${i18n_url('sys:static', path=obj.icon_bitmap_path)}" alt="${_('application icon')}">
            </span>
        % else:
            <span class="o-apps-menu-icon icon icon-${obj.active_icon_class}"></span>
        % endif
        <span class="o-apps-menu-label">
            ${h.link_other(obj.label, i18n_path(request.path), obj.get_path(), _class="o-apps-menu-link")}
        </span>
        </li>
    % endif
</%def>
