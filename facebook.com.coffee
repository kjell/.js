#if window.location.pathname == '/'
#  style '#contentArea', 'display:none'

hide_unless_hovered '#contentArea', '.rightColumnWrapper', '#pagelet_sidebar', '#pagelet_navigation', '#pagelet_ego_pane', '#pagelet_sidebar', 'div.tickerActivityStories'

# key '⌘+r, ctrl+r', ->
  # console.log 'beep'
  # $(".fbJewel").addClass('hasNew')
  # $('#notificationsCountValue, #mercurymessagesCountValue, #requestsCountValue').html('5')

$ ->
  # Remove facebook ads ("this person and this person liked this stupid shit") ("Trending Articles")
  delay 500, ->
    $('.uiStreamAdditionalLogging').parents('.uiStreamStory').remove()
    $('.ogAggregationHeaderTitle:matches(trending)').parents('.uiStreamStory').remove()
    $('.ogAggregationTrendingList').parents('.uiStreamStory').remove()
    $("h6:matches('recently played games')").parents('.uiStreamStory').remove()
    # Sidebar  ("Sponsored")
    $("#pagelet_ego_pane, .ego_column, #pagelet_ego_pane_w, #pagelet_timeline_ego_box").remove()
