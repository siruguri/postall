json.array!(@locations) do |location|
  json.extract! location, :lat, :long, :name, :address
  json.url location_url(location, format: :json)
end
