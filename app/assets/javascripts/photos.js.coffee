ready = ->
  $('.close_comment').toggle()
  $('.close_comment').on 'click', (event) ->
    self = this
    $(self).siblings('.comment').empty()
    $(self).toggle()
    $(self).siblings('.add_comment').toggle()
  $('.add_comment').on 'click', (event) ->
    self = this
    url = $(self).attr("data")
    $.get url + '/comments/new', (data) ->
      $(self).siblings('.comment').append(data)
      $(self).toggle()
      $(self).siblings('.close_comment').toggle()
$(document).ready(ready)
$(document).on('page:load', ready)