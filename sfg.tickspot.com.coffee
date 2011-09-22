$ ->
  $.extend $.expr[":"], {
    "matches": (elem, i, match, array) ->
      (elem.textContent || elem.innerText || "").match ///#{match[3]}///i
  }

  String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""

  # Watch the timecard notes field for content, and set the project and time values
  # based on whether the first line matches the pattern "[2h|30m] projectname"
  $("textarea#entry_notes").live 'keyup', ->
    pattern = /^([\d|\.]+)(m|h)\s(\w+)/

    time_spent = (number, scale) ->
      switch scale
        when 'h' then number
        when 'm' then number/60

    select_project = (project) ->
      value = $("select#client_id option:matches('#{project}')").attr('selected', 'selected').val()
      $.get "/timecard/update_projects?client_id=#{value}"

    if match = $(@).val().match pattern
      [_, number, scale, project] = match
      rest = $(@).val().replace(pattern, '').strip()
      $("#entry_hours").val time_spent(number, scale)
      select_project(project)
      $(@).val(rest)
