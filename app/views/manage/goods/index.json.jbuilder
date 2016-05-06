json.array!(@manage_goods) do |manage_good|
  json.extract! manage_good, :id, :creation_id, :user_id
  json.url manage_good_url(manage_good, format: :json)
end
