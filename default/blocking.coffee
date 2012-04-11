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
9to5mac.com hckrnews.com macobserver.com
hacker-newspaper.gilesb.com techcrunch.com buzzfeed.com "

if time_wasters.indexOf(location.host.replace('www.','')) > -1
  console.log document.referrer
  unless document.referrer.match(/instapaper|google|duckduckgo/)
    block "This is your life and it's ending one minute at a time."