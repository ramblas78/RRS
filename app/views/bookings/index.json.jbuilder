json.array!(@bookings) do |booking|
  json.extract! booking, :id, :date, :table, :comment, :ip_address, :status, :source, :type
  json.url booking_url(booking, format: :json)
end
