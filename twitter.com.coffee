#$(".trends-inner, p.promo, .user-rec-inner, .footer").hide
$ ->
  $("<style type='text/css'>#{selector} { display: none }</style>").appendTo("head") for selector in [
    '.trends-inner', 'p.promo', '.user-rec-component',
    '.component-spacer', 'div.dashboard', '#global-nav-whotofollow'
  ]

