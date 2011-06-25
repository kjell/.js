#
# reload ajax when auto-pagerizing
#

$(document).bind 'GM_AutoPagerizeNextPageLoaded', ->
  $("<script>attach_ajax();</script>").appendTo $("body")
  shift_click_to_archive_and_open()

#
# shift-click opens links in background tab and archives them
#

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

#
# add folders to whatever safari extension
#
$("#categoryHeader span:first").appendTo("#categoryHeader")
$("<a>Folders</a>").css({'font-weight': 'normal'}).appendTo("#categoryHeader").click ->
  $("#folder_container").toggle()

fc = $("#folder_container")
fc.appendTo("body").hide().css({position: 'fixed', right: '55px', top: '95px'})

