#$(".trends-inner, p.promo, .user-rec-inner, .footer").hide
$ ->
  style(selector, "display: none") for selector in [
    '.trends-inner', 'p.promo', '.user-rec-component',
    '.component-spacer', 'div.dashboard', '#global-nav-whotofollow'
  ]

  # TODO: cleanup, generalize?
  replaceGoogleMapsLinksWithGeojsonio = ->
    regex = /\/\/maps\.google\.com\/maps\?(ll|q)\=(.*)%2C(.*)&.*?\"?/
    geojsonio_link = (lat, lng, endQuote) ->
      marker = """{"features":[{"geometry":{"coordinates":[#{lng},#{lat}],"type":"Point"},"properties":{},"type":"Feature"}],"type":"FeatureCollection"}"""
      "http://geojson.io/#data=data:application/json,#{escape(marker)}#{endQuote || ''}"

    # on a tweet permalink pages it's simple
    [].map.call document.querySelectorAll('.metadata a.tweet-geo-text'), (link) ->
      ll = link.href.match(regex)
      link.href = geojsonio_link(ll[2], ll[3])

    # on timeline pages the link is hidden in a `data-expanded-footer` template
    # attribute. Extract and replace it.
    [].map.call document.querySelectorAll('[data-expanded-footer]'), (li) ->
      template = li.getAttribute('data-expanded-footer')
      if ll = template.match(regex)
        li.setAttribute('data-expanded-footer',
          template.replace(regex, geojsonio_link(ll[2], ll[3], '"')))

  delay 5, replaceGoogleMapsLinksWithGeojsonio
