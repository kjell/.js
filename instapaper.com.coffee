$(document).bind 'GM_AutoPagerizeNextPageLoaded', ->
  $("<script>attach_ajax();</script>").appendTo $("body")
  shift_click_to_archive_and_open()
  
shift_click_to_archive_and_open = ->
  $("a.tableViewCellTitleLink").click (e) ->
    if e.shiftKey
      e.preventDefault()
      button = $(@).parents(".tableViewCell").find(".archiveButton")
      id     = button.attr("id").substring(4)
      href   = button.attr("href")
      $.get("#{href}?ajax=1&el=tableViewCell#{id}")
      window.open(@.href, '_blank')
      self.focus()
  
shift_click_to_archive_and_open()