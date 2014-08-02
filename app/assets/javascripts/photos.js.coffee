$(document).ready ->
  $('.close_comment').toggle()
  $('.add_comment').on 'click', (event) ->
    self = this
    $.get '/comments/new', (data) ->
      $(self).siblings('.comment').append(data)
      $(self).toggle()
      $(self).siblings('.close_comment').toggle()