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

    $('.inspector-wrapper .details span.data-attribute').html $('select.data-selector').val()

    # Event handler for the select dropdown
    win = document.getElementById("iframe").contentWindow
    $('select.data-selector').change ->
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
        # console.log $('select.data-selector').val()
        win.postMessage [$('select.data-selector').val(), true], window.location.origin + Routes.theme_path(1)

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
        win.postMessage [$('select.data-selector').val(), false], window.location.origin + Routes.theme_path(1)

        $(this).removeClass 'btn-danger'
               .addClass 'btn-success'

        $(this).html('Activate Inspector')

