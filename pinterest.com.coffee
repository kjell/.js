style ".NagUnauth.Module", "display: none;"

style '.Pin.fadeAd', "opacity: 0.1; transition-delay: 0s;"
# style '.Pin', 'transition: 0.1s all; transition-delay: 2s;'
style '.fadeAd:hover', "opacity: 0.9;"

$ ->
  removeAds()
  setInterval removeAds, 5000

removeAds = ->
  ads = $('.creditName:contains("Picked for you"), .creditName:contains("Promoted by")')
  ads.map (index) ->
    $(@).parents('.Pin.summary').addClass('fadeAd')
