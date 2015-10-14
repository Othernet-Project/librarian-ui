((window, $, templates) ->

  $.fn.tabable = (options) ->
    options ?=
      activator: '.o-tab-handle-activator'
      panel: '.o-tab-panel'

    {activator, panel} = options
    elem = $ this

    # Cache all panels
    elem.find(activator).each () ->
      act = $ this
      act.data 'panel', elem.find act.attr 'href'
      return

    closeActivePanel = () ->
      elem.find(panel + '.active')
        .removeClass('active')
        .ariaProperty('expanded', 'false')
      elem.find(activator + '.active')
        .removeClass('active')
      return

    activatePanel = (targetActivator) ->
      targetActivator.addClass 'active'
      targetPanel = targetActivator.data 'panel'
      targetPanel.addClass 'active'
      targetPanel.ariaProperty 'expanded', 'true'
      url = targetPanel.data 'url'
      if not url
        return
      targetPanel.html templates.spinner
      res = $.get url
      res.done (data) ->
        targetPanel.html data
      res.fail () ->
        targetPanel.html template.loadFail
      return

    elem.on 'focus', activator, (e) ->
      elem.trigger 'activator-focus'

    elem.on 'click', activator, (e) ->
      e.preventDefault()
      closeActivePanel()
      act = $ this
      activatePanel act

    elem

) this, this.jQuery, this.templates
