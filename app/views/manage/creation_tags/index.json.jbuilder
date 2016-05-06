json.array!(@manage_creation_tags) do |manage_creation_tag|
  json.extract! manage_creation_tag, :id, :creation_id, :references
  json.url manage_creation_tag_url(manage_creation_tag, format: :json)
end
