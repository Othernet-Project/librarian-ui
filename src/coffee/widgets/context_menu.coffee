((window, $) ->

  ExpandableBox = window.o.elements.ExpandableBox

  class ContextMenu extends ExpandableBox
    collapsible: 'self'
    activator: '.o-contextbar-menu'

    getActivator: () ->
      $ @activator


  window.export 'ContextMenu', 'widgets', ContextMenu

) this, this.jQuery
