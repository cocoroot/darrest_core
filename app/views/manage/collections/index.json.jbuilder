json.array!(@manage_collections) do |manage_collection|
  json.extract! manage_collection, :id, :sid, :user_id, :title
  json.url manage_collection_url(manage_collection, format: :json)
end
