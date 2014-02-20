$ ->
  $('.bookmark_title.unread').on 'click', (e) ->
    destroy = @.parentNode.querySelector('.destroy')
    destroy.click()

