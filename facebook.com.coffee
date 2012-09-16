#= require vendor/keymaster.js

#if window.location.pathname == '/'
#  style '#contentArea', 'display:none'

style '.rightColumnWrapper, #pagelet_sidebar, #pagelet_navigation, #pagelet_ego_pane, #pagelet_sidebar, div.tickerActivityStories', 'display:none'
style '#pagelet_ego_pane, .ego_column, #pagelet_ego_pane_w, #pagelet_timeline_ego_box', 'display: none !important'

$ ->
  # Remove facebook ads ("this person and this person liked this stupid shit") ("Trending Articles")
  delay 1000, ->
    $('.uiStreamAdditionalLogging').parents('.uiStreamStory').remove()
    $('.ogAggregationHeaderTitle:matches(trending)').parents('.uiStreamStory').remove()
    $('.ogAggregationTrendingList').parents('.uiStreamStory').remove()
    $("h6:matches('recently played games')").parents('.uiStreamStory').remove()
