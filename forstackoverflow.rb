require 'rubygems'
require 'mechanize'

agent = Mechanize.new
page = agent.get('http://www.example.com/')
form = page.forms.first

a = form.field("firstselectlist")
a.options[1].click

#form["customBicycleSearch$ddnBikeSearchMake"].options = 835
model = form.field("secondselectlist")
pp model.options
year = form.field("customBicycleSearch$ddnBikeSearchYear")



#make.options.each do |option|
  #puts option.text
#end

#pp form.field("customBicycleSearch$ddnBikeSearchMake").options
pp form


model.options.each do |option|
	puts option.text
end



#form.customBicycleSearch$ddnBikeSearchMake = 'Trek'
#form["customBicycleSearch$ddnBikeSearchMake"] = "Poop"




#pp form.field_with(:name => "customBicycleSearch$ddnBikeSearchModel").options



