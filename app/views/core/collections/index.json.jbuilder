json.array!(@core_collections) do |core_collection|
  json.extract! core_collection, :id, :sid, :user_id, :title
  json.url core_collection_url(core_collection, format: :json)
end
