#= require vendor/select2.min.js
$ ->
  $('.commit-desc').show()

at 'miabot/galleries.csv', ->
  style '.csv-data tr td', 'max-width: 200px; overflow: scroll !important;'
  style '.csv-data tr td:nth-child(3)', 'max-width: 300px; overflow: scroll !important;'

at 'artsmia/collection', ->
  [].map.call(document.querySelectorAll('.file.js-details-container'), (object) ->
    path = object.querySelector('.info .js-selectable-text').innerText
    id = path.match(/\/(\d+).json/)[1]
    buttons = $(object).find('.button-group')
    buttons.append('<a href="//collections.artsmia.org/?page=detail&id='+id+'" class="minibutton tooltipped tooltipped-s" aria-label="view on collections.artsmia.org">@collections</a>')
    buttons.append('<a href="http://artsmia.github.io/ag-sketches/#/edit/'+id+'" class="minibutton tooltipped tooltipped-s" aria-label="Full res image">@zoom</a>')
  )
