json.array!(@manage_creation_categories) do |manage_creation_category|
  json.extract! manage_creation_category, :id, :creation_id, :category_id
  json.url manage_creation_category_url(manage_creation_category, format: :json)
end
