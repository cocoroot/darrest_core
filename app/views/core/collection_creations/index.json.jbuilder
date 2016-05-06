json.array!(@core_collection_creations) do |core_collection_creation|
  json.extract! core_collection_creation, :id, :collection_id, :creation_id
  json.url core_collection_creation_url(core_collection_creation, format: :json)
end
