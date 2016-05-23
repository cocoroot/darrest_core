json.array!(@collections) do |collection|
  json.extract! collection, :id, :sid, :site_user_id, :title
  json.url collection_url(collection, format: :json)
end
