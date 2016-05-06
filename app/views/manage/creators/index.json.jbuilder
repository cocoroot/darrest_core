json.array!(@manage_creators) do |manage_creator|
  json.extract! manage_creator, :id, :sid, :user_id, :name, :text
  json.url manage_creator_url(manage_creator, format: :json)
end
