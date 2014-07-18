json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user_id, :book_id
  json.url reservation_url(reservation, format: :json)
end
