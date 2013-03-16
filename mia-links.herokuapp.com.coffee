$ ->
  [_, url, title] = window.location.search.match(/url=(.*)&title=(.*)/)
  url ||= document.referrer
  title = unescape(title)

  fill = ->
    delay 500, ->
      ($url = $("#url")).val(url)
      $("#title").val(title)
      fill() unless url && $url.val() == url
  fill()
