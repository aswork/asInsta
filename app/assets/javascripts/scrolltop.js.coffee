ready = ->
  $(window).scroll ->
    element = $('#page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
  


$(document).ready(ready)
$(document).on('page:load', ready)
