#= require_tree ./default

$("#readabilityContainer").remove()

style = (selector, styles) ->
  $("<style type='text/css'>#{selector} { #{styles} }</style>").appendTo("head")


