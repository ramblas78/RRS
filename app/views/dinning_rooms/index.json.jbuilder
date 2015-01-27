json.array!(@dinning_rooms) do |dinning_room|
  json.extract! dinning_room, :id, :name, :widget, :priority
  json.url dinning_room_url(dinning_room, format: :json)
end
