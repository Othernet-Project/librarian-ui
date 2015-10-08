((window, $) ->

  window.templates ?= {}

  $('script[type="text/template"]').each () ->
    elem = $ @
    id = elem.attr('id')
    window.templates[id] = elem.html().trim()

) this, this.jQuery
