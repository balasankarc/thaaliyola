json.array!(@issuings) do |issuing|
  json.extract! issuing, :id, :book_id, :user_id
  json.url issuing_url(issuing, format: :json)
end
