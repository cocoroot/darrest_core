json.array!(@users) do |user|
  json.extract! user, :id, :baas_id
  json.url user_url(user, format: :json)
end
