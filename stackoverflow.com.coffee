$('.everyonelovesstackoverflow, .hireme').hide()
$ ->
  style(selector, "display: none important") for selector in [
    '.everyonelovesstackoverflow', '.hireme', '#newsletter-ad',
    '#newsletter-ad *'
  ]
  $("#newsletter-ad").hide()

  hide_unless_hovered '#sidebar'


