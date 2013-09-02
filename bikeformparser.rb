require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'

#set id range
#start_id = 11861
#stop_id = 30000

#number_of_successes = 0
#number_of_failures = 0

#increase length required to timeout
#http = Net::HTTP.new(@host, @port)
#http.read_timeout = 600

#create and open a local file to save this data
puts "openingthe file"
my_local_file = open("temp_file", "w")
puts "opened the file"

#connect to a sample page to get headers
puts "connecting to bicyclebluebook"
page = Nokogiri::HTML(open("http://www.bicyclebluebook.com/"))#save the page HTML
puts "connected and reading form detail..."
page.css("#customBicycleSearch_ddnBikeSearchMake option").each do |d|
  my_local_file.write(d.text + ";")
end

puts "closing the file"
my_local_file.close
=begin
	
rescue Exception => e
	
end
#get bike general information headers
#bicycle_general_information_headers = page.css('div.eight.columns.listingDetail p span.bold')
	
#write the headers (up through prices) to local file
#puts "Writing headers to file..."
#my_local_file.write("Year:;Make and Model:;" + bicycle_general_information_headers[0].text + ";" + bicycle_general_information_headers[1].text + ";" + bicycle_general_information_headers[3].text + ";")

i = 5;
limit = bicycle_general_information_headers.length-1;
for i in 5..limit
	my_local_file.write(bicycle_general_information_headers[i].text + ";")
  	i=i+1
end
	
#new line	
my_local_file.write("\n")
		
#pause before connecting
sleep(1.0 + rand)

#get error title
error_url = "http://www.bicyclebluebook.com/searchlistingdetail.aspx?id=1"

#save the page HTML
error_page = Nokogiri::HTML(open(error_url))
   	
#save title 
error_title = error_page.css('title').text


#set the range of page ids to scrape for details
(start_id..stop_id).each do |id|
	
	#setup a block to handle a socket error exception (i.e. my internet goes out)
	begin
		#get the page's URL
		url = "http://www.bicyclebluebook.com/searchlistingdetail.aspx?id=#{id}"

		

		#save title 
		title = page.css('title').text
   
		#check to see if title is an error or not	
		if title == error_title
			 puts "Not a valid page"
			 number_of_failures = number_of_failures+1
		else
		  #Connect to the page
			puts "Connecting to page with id #{id}"

			#get bike name (includes make, model, and year)
			bike_name = page.css('span#contentBody_labelListingName.lines')

			#write bike year and make/model to local file
			my_local_file.write(bike_name.text[0,4] + ";" + bike_name.text[5,bike_name.text.length-1] + ";")

			#get bike general information
			bicycle_general_information = page.css('div.eight.columns.listingDetail p span.bold')

			#write bike type
			my_local_file.write(bicycle_general_information[0].next_sibling.text + ";")

			#write price information
			my_local_file.write(bicycle_general_information[2].text + ";" + bicycle_general_information[4].text + ";")

			#write the rest of the information to local file
			i = 5;
			limit = bicycle_general_information.length-1;
			for i in 5..limit
				my_local_file.write(bicycle_general_information[i].next_sibling.text + ";")
				i=i+1
			end

			puts "Finished writing page with id #{id} info"
			number_of_successes = number_of_successes + 1

			#new line	
			my_local_file.write("\n")
		end  
		
		#pause before running the loop again
		sleep(1.0 + rand)
	
	#handle a socket error
	rescue SocketError 
		puts "Socket Error"
		sleep(5.0)
		retry
	rescue 
		puts "A different error"
		sleep(5.0)
		retry
	end
end

#close the file we were writing to
=end


	



