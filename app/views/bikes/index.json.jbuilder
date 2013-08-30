json.array!(@bikes) do |bike|
  json.extract! bike, :year_manufactured, :make, :model, :kind, :msrp, :current_price
  json.url bike_url(bike, format: :json)
end