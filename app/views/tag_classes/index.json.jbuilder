json.array!(@tag_classes) do |tag_class|
  json.extract! tag_class, :id, :name
  json.url tag_class_url(tag_class, format: :json)
end
