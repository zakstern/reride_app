string = "http://www.bicyclebluebook.com/SearchListingDetail.aspx?id=3040755&make=672&model=71750&year=2012"
bike_id = string[string.index("=")+1..string.index("&")-1]
make_id = string[string.index("=", string.index("=")+1)+1..string.index("&", string.index("&")+1)-1]
model_id = string[string.index("model")+6..string.index("year")-2]
year = string[string.index("year")+5..string.index("year")+8]
puts bike_id
puts make_id
puts model_id
puts year
