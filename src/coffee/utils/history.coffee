((window, $) ->

  $.history =
    randomDigit: () ->
      return Math.floor(Math.random() * (9 - 0))

    randomNumber: (digits) ->
      digits ?= 10
      (@randomDigit() for i in [0..digits])

    push: (url) ->
      id = (@randomNumber()).join('')
      res = $.get url
      res.done (data) ->
        # NOTE: This does not work for very large payloads
        window.history.pushState id, null, url
        window.localStorage[id] = data
      res

    pop: (id) ->
      data = window.localStorage[id]
      del window.localStorage[id]
      data


) this, this.jQuery
