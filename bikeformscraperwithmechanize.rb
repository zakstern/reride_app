require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://www.bicyclebluebook.com/')
form = page.forms.first

#make = form.field_("customBicycleSearch$ddnBikeSearchMake")
#form.field("customBicycleSearch$ddnBikeSearchMake").option_with(:value => /835/).tick
form["customBicycleSearch$ddnBikeSearchMake"] = 835
model = form.field("customBicycleSearch$ddnBikeSearchModel")
year = form.field("customBicycleSearch$ddnBikeSearchYear")



#make.options.each do |option|
  #puts option.text
#end

pp form.field("customBicycleSearch$ddnBikeSearchMake").options
pp model.options

model.options.each do |option|
	puts option.text
end



#form.customBicycleSearch$ddnBikeSearchMake = 'Trek'
#form["customBicycleSearch$ddnBikeSearchMake"] = "Poop"




#pp form.field_with(:name => "customBicycleSearch$ddnBikeSearchModel").options



