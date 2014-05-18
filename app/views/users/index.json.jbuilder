json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :librarian, :admin
  json.url user_url(user, format: :json)
end
