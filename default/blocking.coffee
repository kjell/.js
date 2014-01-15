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

inspiration = """Don't ignore your dreams;
don't work too much;
say what you think;
cultivate friendships;
be happy<a href="http://paulgraham.com/todo.html">.</a>"""

time_wasters = "
metafilter.com
ask.metafilter.com
news.ycombinator.com
daringfireball.net
hacker-newspaper.gilesb.com
techcrunch.com
buzzfeed.com
facebook.com
reddit.com
inhabitat.com
packlite.tumblr.com
macrumors.com
appleinsider.com
9to5mac.com
macobserver.com
kottke.org"

# block between 8 and 6 for now.
workday = ->
  h = (new Date).getHours()
  8 < h && h < 18

if time_wasters.indexOf(location.host.replace('www.','')) > -1
  unless document.referrer.match(/instapaper|google|duckduckgo|stackoverflow|pinboard/)
    if workday()
      block(inspiration)
    else
      console.info inspiration
