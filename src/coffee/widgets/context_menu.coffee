((window, $) ->

  ExpandableBox = window.o.elements.ExpandableBox

  class ContextMenu extends ExpandableBox
    constructor: (@id) ->
      super(@id)
      @children = $ '.o-context-menu-menuitem'

      # The refocusTimeout property holds a timer object that is reset each
      # time a menu item is focused. The timer is started by blur event on the
      # menu item, and if it times out, the whole menu is closed. This is a
      # workaround for the hidden navbar becoming unhidden when menu item is
      # focused by keyboard.
      @refocusTimeout = null

      @children.on 'focus', () =>
        if @refocusTimeout?
          clearTimeout @refocusTimeout
        if @collapsed
          @open()
        return

      @children.on 'blur', () =>
        @refocusTimeout = setTimeout () =>
          @close()
          return
        , 100

      @children.updownNav()

      @children.on 'click', (e) ->
        e.preventDefault()
        elem = $ this
        url = elem.attr 'href'
        $.modalContent url

    collapsible: 'self'
    activator: '.o-contextbar-menu'

    onOpen: () ->
      return

    getActivator: () ->
      $ @activator

    updateAria: () ->
      @element.ariaProperty 'hidden', @collapsed


  window.export 'ContextMenu', 'widgets', ContextMenu

) this, this.jQuery
