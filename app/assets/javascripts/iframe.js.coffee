#= require js-routes

$ ->
  listener = (event) =>
    if event.origin isnt "http://localhost:3000/themes/1/inspector"
      @data_name = event.data[0]
      @inspector_active = event.data[1]
      if @inspector_active
        $('body').addClass 'active'
      else
        $('body').removeClass 'active' 

  @inspector_active = false

  if window.addEventListener
    addEventListener "message", listener, false
  else
    attachEvent "onmessage", listener

  $('*')
    .on 'mouseover', (e) ->
      current_element = e.target
      parent.postMessage [current_element.tagName, current_element.clientHeight, current_element.clientWidth, $(e.target).offset().left, $(e.target).offset().top - $(document).scrollTop() ] , window.location.origin + Routes.inspector_theme_path(1)
      return false

    .on 'click', (e) =>
      if @inspector_active
        $(e.target).attr('data-template-key', @data_name)
        alert('Successfully added ' + @data_name)
        return false
