import os

import bottle
from bottle import mako_view as view, get, static_file, request

SCRIPT_PATH = os.path.dirname(__file__)
STATIC_DIR = os.path.normpath(
    os.path.join(SCRIPT_PATH, '../librarian_ui/static'))
DEMO_STATIC_ROOT = os.path.join(SCRIPT_PATH, 'static')

bottle.TEMPLATE_PATH.append(
    os.path.normpath(os.path.join(SCRIPT_PATH, './views')))
bottle.TEMPLATE_PATH.append(
    os.path.normpath(os.path.join(SCRIPT_PATH, '../librarian_ui/views')))

_ = lambda x: x

bottle.BaseTemplate.defaults.update({
    '_': _,  # Dummy i18n fn
    'route': lambda x: '/' + x + '/',  # Dummy route fn
    'request': request,
})

SEARCH_CHOICES = [
    ('fs', 'Search files'),
    ('ci', 'Search content'),
]

CONTEXT_MENU_ITEMS = [
    # id, label, path, icon class, enabled
    ('upload', _('Upload new content'), 'upload', 'upload', True),
    ('download', _('Download'), 'download', 'folder-download', True),
    ('separator',),
    ('settings', _('Settings'), 'settings', 'settings', False),
    ('login', _('Log in'), 'login', 'login', True),
    ('separator',),
    ('help', _('Help'), 'help', 'help-circle', True),
]

@get('/')
@view('demo', search_mode_choices=SEARCH_CHOICES,
      context_menu=CONTEXT_MENU_ITEMS)
def demo():
    return {}


@get('/help/')
@view('help')
def help():
    return {}


@get('/static/<path:path>')
def static(path):
    res = static_file(path, root=STATIC_DIR)
    if not isinstance(res, bottle.HTTPError):
        return res
    return static_file(path, root=DEMO_STATIC_ROOT)


bottle.run(reloader=True, debug=True)
