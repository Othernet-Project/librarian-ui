((window, $) ->

  PulldownMenubar = window.o.widgets.PulldownMenubar
  Statusbar = window.o.widgets.Statusbar
  ContextMenu = window.o.widgets.ContextMenu

  pdmb = new PulldownMenubar('menubar-top')
  scrl = new Statusbar('main-status')
  ctxm = new ContextMenu('context-menu')

  $('#' + window.o.pageVars.statusTabId).tabbable()

  return

) this, this.jQuery
