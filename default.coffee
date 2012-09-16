#= require_tree ./default

$("#readabilityContainer").remove()

style = (selector, styles) ->
  $("<style type='text/css'>#{selector} { #{styles} }</style>").appendTo("head")

$.expr[":"].matches = (elem, i, match, array) ->
    $(elem).text().toUpperCase().indexOf(match[3].toUpperCase())>=0;

delay = (ms, func) -> setTimeout func, ms

