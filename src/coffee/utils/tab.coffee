((window, $) ->

  $.fn.tab = () ->
    elem = $ this
    handles = elem.find('.tab-handles .handle')
    panels = elem.find('.tab-panels .panel')
    handles.each () ->
      $(this).on 'click', (e) ->
        handle = $ this
        panel = $('#' + handle.find('a').data('panel'))
        handles.removeClass 'active'
        panels.removeClass 'active'
        handle.addClass 'active'
        panel.addClass 'active'

    handles.first().click()
) this, this.jQuery
