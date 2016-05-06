json.array!(@core_tags) do |core_tag|
  json.extract! core_tag, :id, :name
  json.url core_tag_url(core_tag, format: :json)
end
