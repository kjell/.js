$('.everyonelovesstackoverflow, .hireme').hide()
$ ->
  style(selector, "display: none important") for selector in [
    '.everyonelovesstackoverflow', '.hireme', '#newsletter-ad',
    '#newsletter-ad *'
  ]
  $("#newsletter-ad").hide()

  style('#sidebar > *', 'visibility: hidden')
  style('#sidebar:hover > *', 'visibility: visible')


