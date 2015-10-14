((window, $) ->

  PulldownMenubar = window.o.widgets.PulldownMenubar
  Statusbar = window.o.widgets.Statusbar
  ContextMenu = window.o.widgets.ContextMenu

  pdmb = new PulldownMenubar window.o.pageVars.menubarId
  scrl = new Statusbar window.o.pageVars.statusbarId
  ctxm = new ContextMenu window.o.pageVars.contextmenuId

  $('#' + window.o.pageVars.statusTabId).tabable()

  return

) this, this.jQuery
