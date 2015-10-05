((window, $, templates) ->

  modalContent = templates.modalContent
  body = $ document.body

  $.modalContent = (contentUrl) ->
    # Kill old modal
    $('#modal-content').remove()

    # Make a new modal
    modal = $(templates.modalContent)
    modal.appendTo body

    # Load the contents
    panel = modal.find '#modal-panel'
    panel.load contentUrl

) this, this.jQuery, this.templates
