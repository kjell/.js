#= require_tree ./default
#= require vendor/select2.min.js

$("#readabilityContainer").remove()

style = (selector, styles) ->
  $("<style type='text/css'>#{selector} { #{styles} }</style>").appendTo("head")

$.expr[":"].matches = (elem, i, match, array) ->
    $(elem).text().toUpperCase().indexOf(match[3].toUpperCase())>=0;

delay = (ms, func) -> setTimeout func, ms

if window.location.search.match(/\?utm/)
  url = window.location.origin + window.location.pathname
  console.log 'beep'
  window.location = url
  # TODO: I'm getting errors with origin on this ajax request,
  # so for now do the easy thing and blow away all the search params.
  # Might break the site? I was thinking I'd check for a 200 with the $.head
  # and only redirect if that was good, but I'm not smart enough
  # if $.head(url).success ->
    # window.location = url
$ ->
  # $('select').filter(-> $('option', this).length > 10).select2()
