json.array!(@quotes) do |quote|
  json.extract! quote, :bike_id, :customer_id
  json.url quote_url(quote, format: :json)
end