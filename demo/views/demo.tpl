<%namespace name="ui" file="_ui.tpl"/>

<!doctype html>

<html lang="en" xml:lang="en">
    <head>
        <title>Librarian UI demo</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/static/css/ui.css">
    </head>
    <body>
        <%ui:pulldown_menubar id="menubar-top" label="Main menu">
            <%def name="menu()">
                Hello menu
            </%def>
            <%def name="hbar()">
                <%ui:contextbar id="search-menubar">
                    <%def name="panel()">
                    ${ui.multisearch('search', placeholder=_('Search'))}
                    </%def>
                </%ui:contextbar>
            </%def>
        </%ui:pulldown_menubar>

        <%ui:context_menu id="context-menu">
            ## menu items
        </%ui:context_menu>

        <div class="o-main-panel" id="${id}">
            <%block name="main">
            </%block>
        </div>

        <%ui:statusbar id="main-status" label="Statusbar">
            <%def name="hbar()">
            Hello statusbar!
            </%def>
            <%def name="status()">
            Librarian UI 0.1
            </%def>
        </%ui:statusbar>

        <!-- inline JS templates -->
        <script="text/tempate" id="modalContent">
            <div class="o-modal-overlay" id="modal-content">
                <div class="o-modal-window" role="window" id="modal-window">
                    <div class="o-modal-content o-modal-panel" role="document" id="modal-panel">
                        <span class="o-modal-spinner">${_('Loading...')}</span>
                    </div>
                </div>
            </div>
        </script>

        <!-- third-party libraries -->
        <script src="/static/js/jquery.js"></script>

        <!-- Librarian UI modules -->
        <script src="/static/js/utils/dahelpers.js"></script>
        <script src="/static/js/utils/export.js"></script>
        <script src="/static/js/utils/templates.js"></script>
        <script src="/static/js/utils/aria.js"></script>
        <script src="/static/js/utils/kbdnav.js"></script>
        <script src="/static/js/utils/modal.js"></script>
        <script src="/static/js/elements/element.js"></script>
        <script src="/static/js/elements/expandable_box.js"></script>
        <script src="/static/js/widgets/pulldown_menubar.js"></script>
        <script src="/static/js/widgets/statusbar.js"></script>
        <script src="/static/js/widgets/context_menu.js"></script>

        <!-- demo-specific modules -->
        <script src="/static/js/main.js"></script>
    </body>
</html>
