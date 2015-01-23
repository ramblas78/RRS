json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :country, :address, :phone, :url, :email
  json.url restaurant_url(restaurant, format: :json)
end
