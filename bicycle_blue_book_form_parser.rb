require 'rubygems'
require 'mechanize'

agent = Mechanize.new

#increase length required to timeout
#http = Net::HTTP.new(@host, @port)
#http.read_timeout = 600

#create and open a local file to save this data
puts "Opening the local file to write to"
my_local_file = open("bicycle_make_model_year_combos_4", "w")
puts "Opened the file"

combo_counter = 0 #count how many valid combos were written
current_combo_counter = 0
make_counter = 0

mainpage = agent.get('http://www.bicyclebluebook.com/') #Download the main page's HTML structure
form = mainpage.forms.first #find the form from which the bicycle make,model, year combos exist
make = form.field("customBicycleSearch$ddnBikeSearchMake") #find the first form element "Make"

#allow for us to set where we want to start
make_options_copy = []
make_options_counter = 0
starting_make_number = 409  #CHANGE THIS TO WHERE YOU LEFT OFF
make.options.each do |option|
	if make_options_counter >= starting_make_number
		make_options_copy.push(option)
	end
	make_options_counter += 1
end


puts "Writing to file..."

not_first_make = false
make_options_copy.each do |make_option|  #iterate through each make option

	if not_first_make
		puts "Successfully wrote #{current_combo_counter} Combinations of Make #{make_counter+starting_make_number} of #{make.options.count-1}"
		make_counter += 1
		current_combo_counter = 0
	end
	not_first_make = true
	

	page_with_make_selected = agent.get('http://www.bicyclebluebook.com/searchlisting.aspx?make=' + make_option.to_s) #Download the page with the first make selected HTML structure
	form_with_make_selected = page_with_make_selected.forms.first #get the form
	model = form_with_make_selected.field("ctl00$customBicycleSearch$ddnBikeSearchModel") #get the model field that now has options populated
	
	model.options.each do |model_option|

		page_with_make_and_model_selected = agent.get('http://www.bicyclebluebook.com/searchlisting.aspx?make=' + make_option.to_s + 
			'&model=' + model_option.to_s) #Get a page with both make and model selected
		form_with_make_and_model_selected = page_with_make_and_model_selected.forms.first #get the form
		year = form_with_make_and_model_selected.field("ctl00$customBicycleSearch$ddnBikeSearchYear") #get the year field that now has options populated
		
		valid_year_option = false
		year.options.each do |year_option|
			if valid_year_option #check to skip the first "Select Year" value
				my_local_file.write(make_option.to_s + ";" + make_option.text + ";" + model_option.to_s + ";" + model_option.text + ";" + year_option.to_s + ";") #write to file	
				my_local_file.write("\n") #new line
				combo_counter += 1
				current_combo_counter += 1
			end
			valid_year_option = true
		end
	end
end

puts "Closing the file."
my_local_file.close
puts "File is Closed."
puts "Successfully wrote #{combo_counter} Combinations!"


#form["customBicycleSearch$ddnBikeSearchMake"].options = 835

#pp make.options
#model = form.field("ctl00$customBicycleSearch$ddnBikeSearchModel")
#pp model.options
#year = form.field("ctl00$customBicycleSearch$ddnBikeSearchYear")
#pp year.options
#a = form.field("firstselectlist")
#a.options[1].click

#make.options.each do |option|
  #puts option.text
#end

#pp form.field("customBicycleSearch$ddnBikeSearchMake").options





#form.customBicycleSearch$ddnBikeSearchMake = 'Trek'
#form["customBicycleSearch$ddnBikeSearchMake"] = "Poop"




#pp form.field_with(:name => "customBicycleSearch$ddnBikeSearchModel").options



