<%namespace name="ui" file="_ui.tpl"/>

<!doctype html>

<html lang="en" xml:lang="en">
    <head>
        <title>Librarian UI demo</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/static/css/ui.css">
    </head>
    <body>
        <%ui:pulldown_menubar id="menubar-top">
            <%ui:pulldown_menubar_menu id="menubar-top">
                Hello menu
            </%ui:pulldown_menubar_menu>
            <%ui:pulldown_menubar_hbar id="menubar-top" label="Click here">
                Hello menubar
            </%ui:pulldown_menubar_hbar>
        </%ui:pulldown_menubar>

        <%ui:main_panel id="main-panel">
        Hello panel!
        </%ui:main_panel>

        <%ui:statusbar id="main-status">
            <%ui:statusbar_hbar id="main-status" label="Click here">
            Hello statusbar!
            </%ui:statusbar_hbar>

            <%ui:statusbar_status id="main-status">
            Librarian UI 0.1
            </%ui:statusbar_status>
        </%ui:statusbar>

        <script src="/static/js/jquery.js"></script>
        <script src="/static/js/widgets/pulldown_menubar.js"></script>
        <script src="/static/js/widgets/statusbar.js"></script>
    </body>
</html>
