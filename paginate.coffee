#= require vendor/autopager

style '.cursor', 'width: 100%; font-size: 100%; text-align: right;'
style '.cursor a', 'color: white; text-decoration: none; margin-right: 1em; width: 100%; border-bottom: none'

paginate = (link, content, load) ->
  $.autopager(
    link: link,
    content: content,
    load: (c, n) ->
      $(@).before $("""<div class="cursor"><a href="#{c.url}">#{c.page}</a></div>""")
      window.history.pushState(null, null, c.url)
      load() if load
  )
