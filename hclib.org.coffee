$ ->
  at '^/', ->
    # activate the searchbox
    $('#search-ttextbox').attr('tabindex', 0).focus()
    delay 100, ->
      $('#search-ttextbox').attr('tabindex', 0).focus()
    # log me in if I'm not already
    unless document.cookie.match(/HCLAuthToken/)
      window.location = 'https://apps.hclib.org/login/index.cfm'

    style '.home-tiles', 'display: none'

  at '^/login/index.cfm', ->
    $('#accountpin').val(passwords["hclib.org"])
    delay 0, -> $('#loginform').submit()

  at '/about/locations', ->
    eastLake = $('.locations-list > .locations-list__item:nth-child(5)')
    $('.locations-list').prepend(eastLake)
