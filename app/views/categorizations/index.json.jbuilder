json.array!(@categorizations) do |categorization|
  json.extract! categorization, :id, :book_id, :category_id
  json.url categorization_url(categorization, format: :json)
end
