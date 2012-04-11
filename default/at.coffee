RegExp.quote = (str) -> (str+'').replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1")

at = (path, block) ->
  if window.location.href.match(RegExp.quote(path))
    block()
