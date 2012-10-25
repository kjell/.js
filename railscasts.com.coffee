unless window.location.search == '?stop' || window.location.search =='?view=asciicast' || window.location.pathname == '/'
  window.location.search = '?view=asciicast'

$(".nav a[href$='asciicast']").trigger('click');


