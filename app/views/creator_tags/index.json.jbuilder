json.array!(@creator_tags) do |creator_tag|
  json.extract! creator_tag, :id, :creator_id, :tag_id
  json.url creator_tag_url(creator_tag, format: :json)
end
