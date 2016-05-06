json.array!(@manage_creator_tags) do |manage_creator_tag|
  json.extract! manage_creator_tag, :id, :creator_id, :tag_id
  json.url manage_creator_tag_url(manage_creator_tag, format: :json)
end
