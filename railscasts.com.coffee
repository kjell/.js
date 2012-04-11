#unless window.location.search == '?stop' || window.location.pathname == '/'
if window.location.pathname.match /episodes/
  window.location.href =  window.location.href.replace(/rails/, 'ascii')
