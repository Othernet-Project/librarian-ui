((window, $) ->

  $.timeconv = (subtree) ->
    if subtree
      subtree = $ subtree
    else
      subtree = $ document
    time = $ 'time', subtree
    time.each () ->
      elem = $ this
      dtstr = elem.attr 'datetime'
      try
        dt = new Date dtstr
        dt = dt.toLocaleString()
      catch e
        dt = dtstr
      elem.text dt.toString()

) this, this.jQuery
