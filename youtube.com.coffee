$(".ad-div, .mastad, .homepage-side-block").hide()

style '#flash10-promo-div, .yt-alert-player', 'display: none'

style '.youtube5container', 'background: black'

if $('.yt-masthead-multilogin-user .yt-alert-icon').parents('a').find('.yt-masthead-multilogin-user-content').text().match(/artsmia/)
  $multi = $('#yt-masthead-multilogin')
  link = $multi.find("a:contains('gmail.com')")
  console.log link
  link.trigger('click')
