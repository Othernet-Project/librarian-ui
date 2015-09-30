import os

import bottle
from bottle import mako_view as view, get, static_file

SCRIPT_PATH = os.path.dirname(__file__)
STATIC_DIR = os.path.normpath(
    os.path.join(SCRIPT_PATH, '../librarian_ui/static'))
DEMO_STATIC_ROOT = os.path.join(SCRIPT_PATH, 'static')

bottle.TEMPLATE_PATH.append(
    os.path.normpath(os.path.join(SCRIPT_PATH, './views')))
bottle.TEMPLATE_PATH.append(
    os.path.normpath(os.path.join(SCRIPT_PATH, '../librarian_ui/views')))


bottle.BaseTemplate.defaults.update({
    '_': lambda x: x
})

@get('/')
@view('demo')
def demo():
    return {}


@get('/static/<path:path>')
def static(path):
    res = static_file(path, root=STATIC_DIR)
    if not isinstance(res, bottle.HTTPError):
        return res
    return static_file(path, root=DEMO_STATIC_ROOT)


bottle.run(reloader=True, debug=True)
