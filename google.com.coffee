at 'reader', ->
  if $("script:first").html().match(/_USER_EMAIL = ".*@artsmia.org"/)
    window.location = '/reader/view/?authuser=1' # redirect artsmia -> leanside account
  style '.overview-section, #footer, #top-bar, #gb', 'display: none'
  style '#main', 'margin: 0 1em'
  style 'img', 'max-width: 100%'
