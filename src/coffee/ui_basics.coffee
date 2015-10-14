((window, $) ->

  PulldownMenubar = window.o.widgets.PulldownMenubar
  Statusbar = window.o.widgets.Statusbar
  ContextMenu = window.o.widgets.ContextMenu

  pdmb = new PulldownMenubar window.o.pageVars.menubarId
  scrl = new Statusbar window.o.pageVars.statusbarId
  ctxm = new ContextMenu window.o.pageVars.contextmenuId
  statusBarTabs = $('#' + window.o.pageVars.statusTabId)
  statusBarTabs.tabable()
  statusBarTabs.on 'activator-focus', (e)->
    scrl.open()
    return

  return

) this, this.jQuery
