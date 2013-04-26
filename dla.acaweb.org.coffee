$ ->
  $('#results_tn_col1').append("<pre id='csv' contenteditable></pre>")
  $csv = $('pre#csv')

  unless window.webkitNotifications.checkPermission() == 0
    $csv.before("<p id='allow-notifications'><a>Allow Notifications</a></p>")
    $('#allow-notifications').on 'click', ->
      window.webkitNotifications.requestPermission -> console.log 'granted'

  $('#cdmResultsGridList ul li:first-child a[item_id]').map ->
    path = this.href.match(/\/collection\/\w+\/id\/\d+/)
    source = "http://dla.acaweb.org/utils/getstream#{path}"
    $(@).parents('ul:first').find('li:last').append("""<p><audio controls preload=none><source src="#{source}" type="audio/mpeg"></audio></p>""")
    title = $(@).parents('li:last').find('li:nth-child(2) a').html().trim()
    $csv.append("#{title},#{source}\n")

  $('audio').on
    'play': ->
      li = $(@).parents('li:last')
      $('audio').not(@).map -> @.pause(); $(@).parents('li:last').css(background: 'none')
      li.css background: 'rgba(77, 102, 51, .23)'
      title = li.find('li:nth-child(2) a').html().trim()
      window.webkitNotifications.createNotification('', 'Digital Library of Appalcahia', title).show()
    'ended': (e) ->
      $(@).parents('li:last').next().find('audio')[0].play()

style 'audio', 'max-width: 100%'
