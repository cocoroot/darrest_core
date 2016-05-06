json.array!(@core_creation_tags) do |core_creation_tag|
  json.extract! core_creation_tag, :id, :creation_id, :tag_id
  json.url core_creation_tag_url(core_creation_tag, format: :json)
end
