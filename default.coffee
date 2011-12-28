banner = (text) ->
  $("<p>#{text}</p>").
  css({
    width: '20%',
    margin: '10em auto',
    border: '1em solid #369',
    'border-radius': '1em',
    padding: '1em 0',
    'text-align': 'center',
    'background-color': '#eee',
    opacity: '0.3',
    '-webkit-transition': 'all .2s ease-in-out'
  }).hover(
    (->
      $(this).css {
        opacity: '1',
        '-webkit-transform': 'scale(1.5)',
      }),
    (->
      $(this).css {
        opacity: '0.3',
        '-webkit-transform': 'scale(1)'
      })
  )

soft_block = (message) ->
  $("body").hide()
  p = banner(message)
  p.dblclick ->
    $(this).hide()
    $("body").show()
  $("body").after(p)

block = (message) ->
  $("body").hide()
  $("body").after banner(message)

time_wasters = "metafilter.com ask.metafilter.com news.ycombinator.com
reddit.com kottke.org daringfireball.net macrumors.com appleinsider.com
9to5mac.com packlite.tumblr.com hckrnews.com macobserver.com
hacker-newspaper.gilesb.com techcrunch.com buzzfeed.com "

if time_wasters.indexOf(location.host.replace('www.','')) > -1
  unless document.referrer.match(/instapaper|google|duckduckgo/)
    block "This is your life and it's ending one minute at a time."

$("#readabilityContainer").remove()

style = (selector, styles) ->
  $("<style type='text/css'>#{selector} { #{styles} }</style>").appendTo("head")

comicize = (image_selector, next_selector) ->
  $("body").hide()
  (min = $(image_selector).clone().appendTo("html")).css({
    'padding-bottom': "200px",
    display: 'block',
    margin: '35px auto',
    'max-width': '97%',
  })
  $("html").css {height: '111em'}

  $(document).keydown (e) ->
    console.log e.keyCode
    switch e.keyCode
      when 13, 39
        next = $(next_selector).attr('href')
        document.location = next unless next == undefined
      when 96, 27, 192
        min.hide()
        $('body').show()
      when 37
        history.go -1

at = (path, block) ->
  if window.location.pathname.match(path)
    block()
