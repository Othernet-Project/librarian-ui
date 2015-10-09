((window, $) ->

  $.fn.collapsible = (options) ->
    elem = $ this
    options ?=
      button: '.o-collapsible-section-title'
      collapsibleArea: '.o-collapsible-section-panel'
      collapsibleSection: '.o-collapsible-section'
      collapseClass: 'o-collapsed'
    {button, collapsibleArea, collapsibleSection, collapseClass} = options

    elem.on 'click', button, (e) ->
      clicked = $ e.target
      section = clicked.parents collapsibleSection
      panel = section.find collapsibleArea
      section.toggleClass collapseClass
      collapsed = section.hasClass collapseClass
      panel.ariaProperty 'hidden', if collapsed then 'true' else 'false'


) this, this.jQuery
