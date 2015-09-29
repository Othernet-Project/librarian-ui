((window, $) ->
  pulldownMenu = $ ".o-pulldown-menubar"
  activator = pulldownMenu.find ".o-pulldown-menubar-hbar-activator"
  pulldownMenuLinks = $ ".o-pulldown-menubar-menu [role=\"menuitem\"]"
  firstNavMenu = pulldownMenuLinks.first()
  activator.on "click", (e) ->
    e.preventDefault()
    pulldownMenu.toggleClass "open"
    if pulldownMenu.hasClass "open"
      firstNavMenu.focus()
) this, this.jQuery
