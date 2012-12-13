#= require vendor/keymaster
#= require default/at

room_codes_s = """
  DA: Atrium<br>
  DR: Dining Room<br>
  DL: Danebo Lounge<br>
  LR: Living Room<br>
  LL: Lower Level<br>
  SP: South Porch<br>
  FK: Full Kitchen<br>
  LK: Limited Kitchen<br>
  GR: Guest Rooms
"""

at '/admin/index.php?rte=acalm', ->
  d = new Date().getDate()

  $(".calendar-day:contains(' #{d} ')")
    .css({'background': 'url(http://subtlepatterns.com/patterns/grid_noise.png)'})

  $('.calendar-day').slice(0, d-1).add('.calendar-outmonth-day').css('opacity', '0.1')
  $('.navp').after("<p style='font-size: 11px; margin: 2em auto 0 1em'>#{room_codes_s}</p>")

at '/admin/index.php?rte=login', ->
  $('input[name=user]').val('secret')
  $('input[name=passwd]').val('secret')
  $('form').submit()

at '/admin/index.php?rte=welcm', ->
  window.location = 'https://www.danebo.org/admin/index.php?rte=acalm'
