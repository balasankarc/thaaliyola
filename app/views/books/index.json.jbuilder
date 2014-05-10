json.array!(@books) do |book|
  json.extract! book, :id, :serial, :name, :author, :category, :shelf, :row
  json.url book_url(book, format: :json)
end
