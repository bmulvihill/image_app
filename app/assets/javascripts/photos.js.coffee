ready = ->
  $('.close_comment').toggle()
  $('.close_comment').on 'click', (event) ->
    $('.comment').empty()
    $('.close_comment').toggle()
    $('.add_comment').toggle()
  $('.add_comment').on 'click', (event) ->
    self = this
    url = $(self).attr("data")
    $.get url + '/comments/new', (data) ->
      $(self).siblings('.comment').append(data)
      $(self).toggle()
      $(self).siblings('.close_comment').toggle()
$(document).ready(ready)
$(document).on('page:load', ready)