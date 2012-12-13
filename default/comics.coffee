comicize = (image_selector, next_selector, prev_selector) ->
  $("body").hide()
  (min = $(image_selector).clone().appendTo("html")).css({
    'padding-bottom': "200px",
    display: 'block',
    margin: '35px auto',
    'max-width': '97%',
  })
  $("html").css {height: '111em'}

  $(document).keydown (e) ->
    switch e.keyCode
      when 13, 39
        next = $(next_selector).attr('href')
        document.location = next unless next == undefined
      when 96, 27, 192
        min.hide()
        $('body').show()
      when 37
        prev = $(prev_selector).attr('href')
        prev? && document.location = prev || history.go -1
