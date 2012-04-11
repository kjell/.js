style '#social + a', 'display: none'
style ".searchfield h1, #topright", 'visibility: hidden'
style "h3, #foot", 'opacity: 0.1'

$ ->
  $(document).keydown (e) ->
    if e.shiftKey
      if e.keyCode == 68
        console.log $(".download a:first")
        $(".download a:first").click()
