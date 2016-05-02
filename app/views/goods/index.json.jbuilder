json.array!(@goods) do |good|
  json.extract! good, :id, :creation_id, :user_id
  json.url good_url(good, format: :json)
end
