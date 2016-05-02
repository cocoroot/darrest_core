json.array!(@collections) do |collection|
  json.extract! collection, :id, :sid, :user_id, :title
  json.url collection_url(collection, format: :json)
end
