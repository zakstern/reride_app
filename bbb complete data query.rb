require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'net/http'

agent = Mechanize.new

#increase length required to timeout
#http = Net::HTTP.new(@host, @port)
#http.read_timeout = 600

#create and open a local file to save this data
puts "Opening the local file to write to"
today_date = Date.today.to_s
my_local_file = open("bicycle_BBB_full_data_#{today_date}", "a")
puts "Opened the file"

#set counters to count how many valid combos were written
counter = 0 

#open the file containing URLs (update to the latest)
File.open("bicycle_BBB_data_2013-10-21", "r").each do |line|
	url = "http://www.bicyclebluebook.com/#{line}"
	detail_page = agent.get(url)
	
	#Bike_ID
	my_local_file.write(url[url.index("=")+1..url.index("&")-1]+ ";")

	#Make ID
	my_local_file.write(url[url.index("=", url.index("=")+1)+1..url.index("&", url.index("&")+1)-1]+";")

	#Make
	make = agent.page.search(".six > div:nth-child(1) > div:nth-child(5) > span:nth-child(2)")
	my_local_file.write(make.text + ";")

	#Model ID
	my_local_file.write(url[url.index("model")+6..url.index("year")-2]+ ";") #write model_id
	
	#Model
	model = agent.page.search(".six > div:nth-child(1) > div:nth-child(6) > span:nth-child(2)")
	my_local_file.write(model.text + ";")

	#Year
	my_local_file.write(url[url.index("year")+5..url.index("year")+8] + ";") #write year
	
	#MSRP
	msrp = agent.page.search(".six > div:nth-child(1) > div:nth-child(2)")
	msrp_array = msrp.text.strip.split(/\s+/)
	my_local_file.write(msrp_array[2] + ";")

	#Used Prices
	agent.page.search('.bikeValueByCondition div').each do |product| 
		array = product.text.strip.split(/\s+/)
		array.each_with_index do |element,index|
  			if index%2 == 0
  				my_local_file.write(element + ";")
  			end
		end
	end
	my_local_file.write("\n")
end




puts "Closing the file."
#my_local_file.close
puts "File is Closed."
puts "Successfully wrote #{counter} Combinations!"