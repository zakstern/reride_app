require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'net/http'

agent = Mechanize.new

#increase length required to timeout
#http = Net::HTTP.new(@host, @port)
#http.read_timeout = 600

counter = 0 
error_counter = 0
total_count = %x{wc -l #{"Bicycle_make_model_year_combo_complete09032013.txt"}}.split.first.to_i

#create and open a local file to save this data
puts "Opening the local file to write to"
today_date = Date.today.to_s
my_local_file = open("bicycle_BBB_full_data_#{today_date}", "a")
puts "Opened the file"

line_number = 1 #enter in what line to start from

#Open file to read

File.open("Bicycle_make_model_year_combo_complete09032013.txt", "r").each do |line|
    #parse contents into the appropriate variables  
    counter = counter + 1
    if counter >= line_number
    	make_id, make_name, model_id, model_name, year = line.strip.split("\;")
    	begin
		    page_with_make_model_and_year_selected = agent.get('http://www.bicyclebluebook.com/searchlisting.aspx?make=' + make_id + 
					'&model=' + model_id + '&year=' + year) #Get a search page for one bike
		    detail_link = page_with_make_model_and_year_selected.link_with(:text => "View Details")
		    url = "http://www.bicyclebluebook.com" + detail_link.href
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
			puts "Wrote line #{counter} of #{total_count}"

		rescue 
			puts "Error at line #{counter-1}"
			error_counter = error_counter + 1
			next
		end
    end 
end
puts "Wrote #{counter} lines."
puts "#{error_counter} errors"
puts "Closing the file."
my_local_file.close
puts "File is Closed."


