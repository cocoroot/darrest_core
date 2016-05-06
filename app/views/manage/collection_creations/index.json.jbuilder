json.array!(@manage_collection_creations) do |manage_collection_creation|
  json.extract! manage_collection_creation, :id, :collection_id, :creation_id
  json.url manage_collection_creation_url(manage_collection_creation, format: :json)
end
