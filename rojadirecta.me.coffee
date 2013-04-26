at '^/', ->
  console.log 'strict matched /'
  window.location = 'http://forum.rojadirecta.es/forumdisplay.php?15&sort=dateline&order=desc'

at 'forumdisplay.php?15', ->
  $('#stickies').remove()
  $('#threads').prepend $('h3.threadtitle a.title:matches(barcelona)').parents('.threadbit')
