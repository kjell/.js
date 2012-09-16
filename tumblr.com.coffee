#= require paginate
#= require keymaster

style 'li.sponsored_post', 'display: none'

wait = (time, call) -> setTimeout call, time

$ ->
  at '/dashboard', ->
    paginate '#next_page_link', 'ol#posts', ->
      $(document).off 'keydown'
      $(document).on 'keydown', (e) ->
        if e.which == 74
          window.post_cursor = if window.post_cursor == undefined || window.post_cursor.length == 0
            $('ol:last .post:first')
          else
            post_cursor.nextAll('.post:first')

          if $(window.post_cursor).attr('id') == $('ol:last .post:last').attr('id')
            $.autopager('load');

          window.scrollTo(0, window.post_cursor.offset().top - 7)
        if e.which == 0 # TODO: Make k go back one?
          true
