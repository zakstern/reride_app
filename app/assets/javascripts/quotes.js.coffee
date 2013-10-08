# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



ready = ->
	$('#quote_bikes_model').hide()
	$('#quote_bikes_make').change ->
  		$('#quote_bikes_model').show()
  		make = $('#quote_bikes_make :selected').text()
  		
$(document).ready(ready)
$(document).on('page:load', ready)


