# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  jQuery ($) ->
  
  # when the #make field changes
  $("#bike_make_id").change ->

    # make a POST call and replace the content
    make = $("select#bike_make_id :selected").val()
    make = "0"  if make is ""
    jQuery.get "./bikes/update_model_select/" + make, (data) ->
      $("#bikeModels").html data

    false

$(document).ready(ready)
$(document).on('page:load', ready)


