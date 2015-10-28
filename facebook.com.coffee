#if window.location.pathname == '/'
#  style '#contentArea', 'display:none'

# hide_unless_hovered '#contentArea', '.rightColumnWrapper', '#pagelet_sidebar', '#pagelet_navigation', '#pagelet_ego_pane', '#pagelet_sidebar', 'div.tickerActivityStories', '#rightCol'
at '^/', ->
  hide_even_when_hovered '#stream_pagelet'

hide_even_when_hovered '.rightColumnWrapper', '#pagelet_sidebar', '#pagelet_navigation'

quotes = [
  '<blockquote>The master in the art of living makes little distinction between his work and his play, his labor and his leisure, his mind and his body, his education and his recreation, his love and his religion. He hardly knows which is which. He simply pursues his vision of excellence at whatever he does, leaving others to decide whether he is working or playing. To him he is always doing both<a href="https://plus.google.com/+TimOReilly/posts/aYF8V4yD1X6">.</a>

  <cite>Lawrence Pearsall Jacks</cite></blockquote>',

  "<blockquote>The architect must be a prophet... a prophet in the true sense of the term... if he can't see at least ten years ahead don't call him an architect.

  <cite>Frank Lloyd Wright</cite></blockquote>",

  "<blockquote>There is an ulterior motive, too, in architecture, which is always peeping out from around the corner, the idea of creating paradise.

  <cite>Alvar Aalto</cite></blockquote>",

  "<blockquote>Whereas most other modern composers are engaged in manufacturing cocktails of every hue and description, I offer the public pure cold water.

  <cite>Jean Sibelius, Of his Symphony No. 6.</cite></blockquote>",

  "<blockquote>I have imagined so much and had so little

  <cite>HCA</cite></blockquote>",

  "<blockquote>A man's health can be judged by which he takes two at a time - pills or stairs.

  <cite>Joan Welsh</cite></blockquote>"
]

$ ->
  # Remove facebook ads ("this person and this person liked this stupid shit") ("Trending Articles")
  $(quotes.join('<br>')).insertBefore('#stream_pagelet')
  delay 500, ->
    $('.uiStreamAdditionalLogging').parents('.uiStreamStory').remove()
    $('.ogAggregationHeaderTitle:matches(trending)').parents('.uiStreamStory').remove()
    $('.ogAggregationTrendingList').parents('.uiStreamStory').remove()
    $("h6:matches('recently played games')").parents('.uiStreamStory').remove()
    # Sidebar  ("Sponsored")
    $("#pagelet_ego_pane, .ego_column, #pagelet_ego_pane_w, #pagelet_timeline_ego_box").remove()
    $('.uiStreamStoryAttachmentOnly').remove()
    $('#pagelet_megaphone').remove()
    $('._4-u2._xct + ._4-u2._xct').remove()
    $('a[href*="https://www.facebook.com/friends/birthdays"]').remove()
    console.log $('a[href*="https://www.facebook.com/friends/birthdays"]')
    $('.fbRequestList.hasPYMK + div').remove()
    $('#pagelet_advertiser_panel')
