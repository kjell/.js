#$(".trends-inner, p.promo, .user-rec-inner, .footer").hide
$ ->
  style(selector, "display: none") for selector in [
    '.trends-inner', 'p.promo', '.user-rec-component',
    '.component-spacer', 'div.dashboard', '#global-nav-whotofollow'
  ]

