$ ->
  $(".entry > *:gt(#{$('.entry #apf_post_footer').index()-1})").remove()
  $('.tags').remove()
  hide_unless_hovered '#header', '#sidebar'

  $(window).keydown (e) ->
    return if e.shiftKey
    window.location = (switch e.keyCode
      when 37
        $('.post-prev a')
      when 39
        $('.post-next a')).attr('href')
