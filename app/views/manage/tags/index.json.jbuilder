json.array!(@manage_tags) do |manage_tag|
  json.extract! manage_tag, :id, :name
  json.url manage_tag_url(manage_tag, format: :json)
end
