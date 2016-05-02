json.array!(@creation_categories) do |creation_category|
  json.extract! creation_category, :id, :creation_id, :category_id
  json.url creation_category_url(creation_category, format: :json)
end
