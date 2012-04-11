$ ->
  at 'pub/info/locations.cfm', ->
    $("#showMap + table").
      prepend($('<tr bgcolor="#ffffff"><td></td></tr>')).
      prepend($("#showMap + table tr:nth-child(7)")).
      prepend($("#showMap + table tr:nth-child(3)"))

  $("#container").
    before($('<a id="hours" href="/pub/info/locations.cfm">hours</a>').css({
      position: 'absolute',
      left: '0',
      height: '100%',
      display: 'block',
      'text-align': 'center',
      padding: ($(window).width() - 856)/4
    }))
