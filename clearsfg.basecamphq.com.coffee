wanted_pngs = /83Rd|84Bl|27Pk|104Bl|102Yl|98Fl|90Gr|70Yl|87Rd|88Rd|91Or|92Pk|95Or|96Or/

$("#files .file").map ->
  href = $(this).find("h1 a").attr('href')
  href.css {color: 'orange'} if href.match(wanted_pngs)

style '.content.responsible span', 'background: white !important'
