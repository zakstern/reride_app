# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



ready = ->
	models = $('#quote_bikes_models_name').html()
	$('#quote_bikes_makes_name').change ->
		make = $('#quote_bikes_makes_name :selected').text()
		options = $(models).filter("optgroup[label='#{make}']").html()
		if options
			$('#quote_bikes_models_name').html(options)
		else
			$('#quote_bikes_models_name').empty()
  		
$(document).ready(ready)
$(document).on('page:load', ready)




