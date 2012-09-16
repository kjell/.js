$ ->
  $.expr[":"].matches = (elem, i, match, array) ->
    $(elem).text().toUpperCase().indexOf(match[3].toUpperCase())>=0;

  String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""
  delay = (wait, funk) -> setTimeout funk, wait

  $(window).keydown (e) ->
    # cmd-enter saves and activates() the notes field
    if e.keyCode == 13 && e.metaKey
      $('#enter-time-btn').click()
      delay 500, -> $('#entry_notes').focus()

    # Arrow keys go back / forward by day, week.
    if [37, 39].indexOf(e.keyCode) > -1
      li = $('#dates a.current').parent()
      left_arrow = e.keyCode < 38
      direction = if left_arrow then li.prev() else li.next()
      if direction.length
        direction.find('a').click()
      else
        [week, day] = if left_arrow then ['last-week', 5] else ['next-week', 1]
        $("##{week}").click()
        delay 700, -> $("#dates li:nth-child(#{day}) a").click() # go to friday or monday

  # Watch the timecard notes field for content, and set the project and time values
  # based on whether the first line matches the pattern "[2h|30m] projectname"
  $("textarea#entry_notes").live 'keyup', ->
    pattern = /^([\d|\.]+)(m|h)\s(\w+)(.*#(\w+))?/
    "30m sfg #standup".match(pattern)

    time_spent = (number, scale) ->
      switch scale
        when 'h' then number
        when 'm' then number/60

    select_task = (task_string) ->
      task = $("select#task_id option:matches('web'), select#task_id option:matches('software'), select#task_id option:matches('#{task_string}')")
      task.attr('selected', 'selected')

    select_project = (project, task) ->
      value = $("select#client_id option:matches('#{project}')").attr('selected', 'selected').val()
      $.ajax("/timecard/update_projects?client_id=#{value}", dataType: 'script').complete (data) ->
        replacement = data.responseText.replace('Element.update("client_project_task", ', '$("#client_project_task").html(')
        eval replacement
        select_task(task)

    if match = $(@).val().match pattern
      console.log match
      [_, number, scale, project, _, task] = match
      project = 'Software For Good' if project == 'clear' || project == 'sfg'
      project = 'vega' if project == 'instruments'
      project = 'magnetic' if project == 'ratenow'
      rest = $(@).val().replace(pattern, '').strip()
      $("#entry_hours").val time_spent(number, scale)
      select_project(project, task)
      $(@).val(rest)
