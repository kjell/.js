banner = (text) ->
  $("<p>#{text}</p>").
  css({
    width: '20%',
    margin: '10em auto',
    padding: '1em 0',
    'text-align': 'center',
    # 'background-color': '#eee',
    opacity: '0.3',
    '-webkit-transition': 'all .2s ease-in-out'
  }).hover(
    (->
      $(@).css {
        opacity: '1',
        '-webkit-transform': 'scale(1.5)',
      }),
    (->
      $(@).css {
        opacity: '0.3',
        '-webkit-transform': 'scale(1)'
      })
  )

soft_block = (message) ->
  $("body").hide()
  p = banner(message)
  p.dblclick ->
    $(@).hide()
    $("body").show()
  $("body").after(p)

block = (message) ->
  $("body").hide()
  $("body").after banner(message)

time_wasters = "metafilter.com ask.metafilter.com news.ycombinator.com
kottke.org daringfireball.net hacker-newspaper.gilesb.com techcrunch.com
buzzfeed.com facebook.com reddit.com inhabitat.com packlite.tumblr.com"

inspiration = """Don't ignore your dreams;
don't work too much;
say what you think;
cultivate friendships;
be happy<a href="http://paulgraham.com/todo.html">.</a>"""

if time_wasters.indexOf(location.host.replace('www.','')) > -1
  unless document.referrer.match(/instapaper|google|duckduckgo|stackoverflow|fontbros/)
    check = $.get "http://work.dev/pomux"
    check.success (r) -> block(inspiration) if r.indexOf('m') > 0
    true

if """macrumors.com appleinsider.com 9to5mac.com macobserver.com""".indexOf(location.host.replace('www.','')) > -1
  block(inspiration)
