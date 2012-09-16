#= require vendor/select2.min.js
$ ->
  $('.commit-desc').show()

  $('head').append('<link rel="stylesheet" href="http://ivaynberg.github.com/select2/select2-2.1/select2.css" type="text/css" />');

  $("select#language").select2()
