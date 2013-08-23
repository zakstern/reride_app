json.array!(@resellers) do |reseller|
  json.extract! reseller, :name, :city, :state, :zip_code, :street_address, :phone_number, :website
  json.url reseller_url(reseller, format: :json)
end