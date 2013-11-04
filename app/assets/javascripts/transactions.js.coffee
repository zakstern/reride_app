# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#quote_lookup").on("ajax:success", (e, data, status, xhr) ->
    $("#inspection_form").html xhr.responseText
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#inspection_form").html "<p>Transaction not found.  Please confirm transaction number with customer.  If there is a problem, call Zak @ 571-438-7892.</p>"

$(document).ready(ready)
$(document).on('page:load', ready)