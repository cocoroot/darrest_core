json.array!(@core_creator_tags) do |core_creator_tag|
  json.extract! core_creator_tag, :id, :creator_id, :tag_id
  json.url core_creator_tag_url(core_creator_tag, format: :json)
end
