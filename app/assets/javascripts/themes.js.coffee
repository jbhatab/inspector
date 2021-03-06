$ ->
  if $('.themes-inspector').size()

    # Listens for data on the hovered element
    listener = (event) ->
      if event.origin isnt window.location.origin + Routes.theme_path(1)
        $('.inspector-wrapper .details span.element-name').html event.data[0]
        hover_block = $('.hover-block')
        hover_block.height(event.data[1])
        hover_block.width(event.data[2])
        hover_block.css('left', event.data[3] + 'px')
        hover_block.css('top', event.data[4] + 'px')

    @setting_selector = $('.setting-selector').first()
    $('.inspector-wrapper .details span.data-attribute').html @setting_selector.val()

    @setting_selector.show()

    # Event handler for the select dropdown
    win = document.getElementById("iframe").contentWindow
    $('select.setting-group-selector').change ->
      setting_selector = $('.'+$('.setting-group-selector').val())
      $('.setting-selector').hide()
      setting_selector.show()
      $('.inspector-wrapper .details span.data-attribute').html setting_selector.val()
      win.postMessage [setting_selector.val(), true], window.location.origin + Routes.theme_path(1)
      return false

    $('select.setting-selector').change ->
      $('.inspector-wrapper .details span.data-attribute').html $(this).val()
      win.postMessage [$(this).val(), true], window.location.origin + Routes.theme_path(1)
      return false

    # Activates or deactivates the inspector
    $('.trigger-inspector').click ->
      if $(this).hasClass 'btn-success'
        $('.hover-block').show()

        # Adds listener to outer window to
        # recieve the inspector hover data
        win = document.getElementById("iframe").contentWindow
        if window.addEventListener
          addEventListener "message", listener, false
        else
          attachEvent "onmessage", listener

        # Sends the name of current data object
        # that will be injected in the iframe
        # console.log $('select.setting-group-selector').val()
        win.postMessage [$('select.setting-selector:visible').val(), true], window.location.origin + Routes.theme_path(1)

        $(this).removeClass 'btn-success'
               .addClass 'btn-danger'
        $(this).html('Deactivate Inspector')

      else
        $('.hover-block').hide()

        win = document.getElementById("iframe").contentWindow
        if window.addEventListener
          removeEventListener "message", listener, false
        else
          detachEvent "onmessage", listener

        # Sends the name of current data object
        # that will be injected in the iframe
        # console.log $('select.data-selector').val()
        win.postMessage [$('select.setting-group-selector').val(), false], window.location.origin + Routes.theme_path(1)

        $(this).removeClass 'btn-danger'
               .addClass 'btn-success'

        $(this).html('Activate Inspector')
