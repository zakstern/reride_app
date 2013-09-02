include ApplicationHelper

def valid_user_signup
	fill_in "Name",         with: "Example User"
	fill_in "Email",        with: "user@example.com"
	fill_in "Password",     with: "foobar"
	fill_in "Confirm Password", with: "foobar"
end

def valid_bike_shop_signup
	fill_in "Shop Name",         with: "Example Store"
  fill_in "Street Address",	with: "100 Fake Street"
  fill_in "City",        	with: "City"
  fill_in "State",     	with: "CA"
  fill_in "Zip Code", 	with: "90405"
  fill_in "Phone Number",	with: "999-999-9999"
  fill_in "Website",		with: "http://www.example.com"
  fill_in "First Name",	with: "Jim"
  fill_in "Last Name",	with: "Smith"
  fill_in "Email", 		with: "fake@fake.com"
  fill_in "Password",		with: "temporary", :match => :prefer_exact
  fill_in "Password Confirmation:", with: "temporary", :match => :prefer_exact
end

def valid_quote_params

end