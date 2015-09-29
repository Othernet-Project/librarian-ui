((window, $) ->
  statusbar = $ '.o-statusbar'
  statusbarHbar = statusbar.find '.o-statusbar-hbar'
  activator = statusbar.find '.o-statusbar-hbar-activator'

  activator.on "click", (e) ->
    e.preventDefault()

  statusbarHbar.on "click", (e) ->
    statusbar.toggleClass "open"

) this, this.jQuery
