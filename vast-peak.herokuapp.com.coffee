craigslistFlagAsSpamUrl = (url) ->
  _id = url.match(/(\d+)\.html$/)[1]
  'https://post.craigslist.org/flag?flagCode=15&postingID=' + _id


$ ->
  # Delete annoying spammy craigslist posts. I can't take them! mattressdepot!
  delay 0, ->
    $('.story h1 a[href*=craigslist]').map ->
      _url = craigslistFlagAsSpamUrl(this.href)
      $(@).parent().append(' [<a href="'+_url+'">SPAMSPAMSPAM</a>]')
      if $(@).parents('.story-body')[0].innerText.match('mattressdepot')
        $.ajax({type: 'GET', async: false, url: _url})
        $(@).parents('li.story').remove()

  # Larger pinterest thumbnails
  delay 0, ->
    $('img[src*="pinimg.com/192"]').map ->
      @.src = @.src.replace('192x', '736x')
