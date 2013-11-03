# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#quote_lookup").on("ajax:success", (e, data, status, xhr) ->
    $("#inspection_form").append xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#inspection_form").append "<p>ERROR</p>"

$(document).ready(ready)
$(document).on('page:load', ready)