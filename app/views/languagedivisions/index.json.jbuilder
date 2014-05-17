json.array!(@languagedivisions) do |languagedivision|
  json.extract! languagedivision, :id, :book_id, :language_id
  json.url languagedivision_url(languagedivision, format: :json)
end
