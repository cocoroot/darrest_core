json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :tag_class_id, :site_id
  json.url tag_url(tag, format: :json)
end
