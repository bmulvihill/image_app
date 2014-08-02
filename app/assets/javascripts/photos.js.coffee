$(document).ready ->
  $('.new_comment').on 'click', (event) ->
    self = this
    $.get '/comments/new', (data) ->
      console.log event.target.id
      $(self).append(data)