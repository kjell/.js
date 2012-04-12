#= require paginate

style '#social + a, .ad, aside#bnr', 'display: none'
style ".searchfield h1, #topright", 'visibility: hidden'
style "h3, #foot", 'opacity: 0.1'

$ ->
  $(document).keydown (e) ->
    if e.shiftKey
      if e.keyCode == 68
        console.log $(".download a:first")
        $(".download a:first").click()

paginate  "table#searchResult tr:last a:last", '#searchResult'
style '.cursor a', 'color: #009;'
