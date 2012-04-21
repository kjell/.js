#= require paginate

archive = (box) ->
  window.b = button = $(box).parents(".tableViewCell").find(".archiveButton")
  id     = button.attr("id").substring(4)
  href   = button.attr("href")
  $.get("#{href}?ajax=1&el=tableViewCell#{id}")

#
# shift-click opens links in background tab and archives them
#

shift_click_to_archive_and_open = ->
  $("a.tableViewCellTitleLink").click (e) ->
    if e.shiftKey
      e.preventDefault()
      archive(@)
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

$('.movemenu').css {right: '481px', top: '23px'}

delay = (ms, func) -> setTimeout func, ms

shift_click_to_star_and_archive = ->
  $(".likeBox a").live 'click', (e) ->
    # like_href = $(@).find('a:first').href
    # e.preventDefault().stopPropagation()
    if e.shiftKey
      likebox = @
      console.log 'shift'
      # delay 5000, ->
      #   console.log 'archiving'
        # $.get like_href, {async: false}
        # archive(likebox)
    # return false

shift_click_to_star_and_archive()

$("form[action='/search']").css({'width': '200px', float: 'right'}).appendTo("#categoryHeader")

paginate '.pagination a:last', '#bookmark_list', ->
  $("<script>attach_ajax();</script>").appendTo $("body")
  shift_click_to_archive_and_open()
  shift_click_to_star_and_archive()
