#= require paginate
style 'li.sponsored_post', 'display: none'

wait = (time, call) -> setTimeout call, time

$ ->
  at '/dashboard', ->
    paginate '#next_page_link', 'ol#posts'
