json.array!(@creation_tags) do |creation_tag|
  json.extract! creation_tag, :id, :creation_id, :tag_id
  json.url creation_tag_url(creation_tag, format: :json)
end
