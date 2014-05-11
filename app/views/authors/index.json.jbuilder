json.array!(@authors) do |author|
  json.extract! author, :id, :serial, :name, :category
  json.url author_url(author, format: :json)
end
