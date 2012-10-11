hide_unless_hovered = (selectors...) ->
  for selector in selectors
    style("#{selector} > *", 'visibility: hidden')
    style("#{selector}:hover > *", 'visibility: visible')

