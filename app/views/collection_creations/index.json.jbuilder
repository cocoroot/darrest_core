json.array!(@collection_creations) do |collection_creation|
  json.extract! collection_creation, :id, :collection_id, :creation_id
  json.url collection_creation_url(collection_creation, format: :json)
end
