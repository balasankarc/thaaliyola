json.array!(@shelfpositions) do |shelfposition|
  json.extract! shelfposition, :id, :book_id, :shelf_id
  json.url shelfposition_url(shelfposition, format: :json)
end
