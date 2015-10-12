((window, $) ->

  CLICKABLE_TARGET = 42
  RETURN = 13
  ESC = 27

  $.fn.collapsible = (options) ->
    elem = $ this
    options ?=
      button: '.o-collapsible-section-title'
      collapsibleArea: '.o-collapsible-section-panel'
      collapsibleSection: '.o-collapsible-section'
      collapseClass: 'o-collapsed'
    {button, collapsibleArea, collapsibleSection, collapseClass} = options

    # The default stylesheet assigns a 'large-enough' max-height to uncollapsed
    # variant of the section. As this height does not exactly match the actual
    # height of uncollapsed section, the animation isn't smooth. Here we go
    # through all panels, get their height, and adjust the max-height of an
    # uncollapsed variant.
    elem.find(collapsibleSection).each () ->
      section = $ this
      panel = section.find collapsibleArea
      totalHeight = panel.outerHeight()
      section.css 'max-height', totalHeight + CLICKABLE_TARGET

    onclick = (e) ->
      clicked = $ e.target
      section = clicked.parents collapsibleSection
      panel = section.find collapsibleArea
      section.toggleClass collapseClass
      collapsed = section.hasClass collapseClass
      panel.ariaProperty 'hidden', if collapsed then 'true' else 'false'
      panel.focus()

    elem.on 'click', button, onclick
    elem.on 'keydown', button, (e) ->
      if e.which isnt RETURN
        return
      onclick.call this, e
      return

    elem.on 'keydown', collapsibleSection, (e) ->
      if e.which isnt ESC
        return
      panel = $ e.target
      section = panel.parents collapsibleSection
      button = section.find button
      section.addClass collapseClass
      panel.ariaProperty 'hidden', 'true'
      button.focus()

) this, this.jQuery
