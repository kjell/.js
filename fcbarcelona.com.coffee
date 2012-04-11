at '/football/first-team/calendar', ->
  $next = $(".upcoming")
  $all  = $(".widget_calendar li.visitor, .widget_calendar li.local")
  i     = $all.index($next)
  $old = $all.slice(0,i-3)

  $old.remove()
  $(".widget_calendar .inner-list ul li ul").each ->
    ul = $(@)
    if ul.children().length == 0
      ul.parents(".inner-list").prevAll(".month").andSelf().remove()
