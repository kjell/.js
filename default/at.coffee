RegExp.quote = (str) -> (str+'').replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1")

at = (path, block) ->
  if path.match /^\^/
    strict = true
    path = path[1..-1]

  if !strict && window.location.href.match(RegExp.quote(path)) || window.location.pathname == path
    block()
