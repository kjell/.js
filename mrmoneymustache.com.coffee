$ ->
  $(".entry > *:gt(#{$('.entry #apf_post_footer').index()-1})").remove()
  $('.tags').remove()
  $('#header, #sidebar').css('opacity', '0.1').hover ->
    $(this).css('opacity', '1')

  $(window).keydown (e) ->
    window.location = (switch e.keyCode
      when 37
        $('.post-prev a')
      when 39
        $('.post-next a')).attr('href')
