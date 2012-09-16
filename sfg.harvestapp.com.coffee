$ ->
  String::strip = -> if String::trim? then @trim() else @replace /^\s+|\s+$/g, ""
  delay = (wait, funk) -> setTimeout funk, wait

  $(window).keydown (e) ->
    # cmd-enter saves and activates() the notes field
    if e.keyCode == 13 && e.metaKey
      $('#add_time_link').click()
      delay 1500, ->
        console.log "focus #day_entry_notes?"
        $('#day_entry_notes').focus()

    # Arrow keys go back / forward by day, week.
    if [37, 39].indexOf(e.keyCode) > -1 && !e.shiftKey
      li = $('#dates a.current').parent()
      left_arrow = e.keyCode < 38
      direction = if left_arrow then 'previous' else 'next'
      if direction.length
        window.location = $("#timesheet_view_selector a.#{direction}").attr('href')
      else
        [week, day] = if left_arrow then ['last-week', 5] else ['next-week', 1]
        $("##{week}").click()
        delay 700, -> $("#dates li:nth-child(#{day}) a").click() # go to friday or monday

  # Watch the timecard notes field for content, and set the project and time values
  # based on whether the first line matches the pattern "[2h|30m] projectname"
  $("textarea#day_entry_notes").live 'keyup', ->
    pattern = /^([\d|\.]+)(m|h)\s(\w+)(.*#(\w+))?/
    "30m sfg #standup".match(pattern)

    time_spent = (number, scale) ->
      switch scale
        when 'h' then number
        when 'm' then number/60

    select_task = (task_string, project_id) ->
      tasks = $("#project#{project_id}_task_selector")
      task = tasks.find("option:matches('software'), option:matches('web'), option:matches('#{task_string}')")
      task.attr('selected', 'selected')

    select_project = (project_name, task) ->
      console.log "project_name: #{project_name}"
      console.log "task: #{task}"

      [p1, p2] = project_name.split(" // ")

      client = $('#project_selector optgroup[label]').filter -> @.label.match ///#{p1 || project_name}///i
      console.log 'client: '
      console.log client

      project = client.find("option:matches(#{task}), option:matches(#{p2 || project_name}), option:matches(#{project_name.slice(0,3)})")
      console.log 'project: '
      console.log project
      project.attr('selected', 'selected')
      $('#project_selector').trigger('change')

      select_task(task, project.val())

    if match = $(@).val().match pattern
      [_, number, scale, project, _, task] = match
      if project == 'clear' || project == 'sfg'
        project = 'Software For Good // Internal'
      project = 'vega' if project == 'instruments'
      if project == 'ratenow'
        project = 'magnetic'
        task = 'ratenow'
      if project == 'htcg'
        project = 'Viking // HCT Guide Mobile Site (Round 2)'
      if project == 'winad'
        project = 'winthrop'
      rest = $(@).val().replace(pattern, '').strip()
      $("#day_entry_hours").val time_spent(number, scale)
      select_project(project, task)
      $(@).val(rest)
