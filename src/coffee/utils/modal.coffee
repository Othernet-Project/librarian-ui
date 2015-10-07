((window, $, templates) ->

  modalContent = templates.modalContent
  body = $ document.body
  ESCAPE = 27

  body.on 'click', '.o-modal-overlay', (e) ->
    elem = $ @
    elem.remove()

  body.on 'click', '.o-modal-close', (e) ->
    elem = $ @
    elem.parents('.o-modal-overlay').remove()

  body.on 'click', '.o-modal-window', (e) ->
    e.stopPropagation()

  body.on 'keydown', '.o-modal-window', (e) ->
    elem = $ @
    if e.which == ESCAPE
      elem.parents('.o-modal-overlay').remove()

  $.modalContent = (contentUrl, failureTemplate) ->
    # Kill old modal
    $('#modal-content').remove()

    # Make a new modal
    modal = $(templates.modalContent)
    modal.appendTo body

    window = modal.find '.o-modal-window'
    window.focus()

    # Load the contents
    panel = modal.find '.o-modal-panel'
    res = $.get contentUrl
    res.done (data) ->
      panel.html data
    res.fail () ->
      panel.html failureTemplate

) this, this.jQuery, this.templates
