json.array!(@manage_categories) do |manage_category|
  json.extract! manage_category, :id, :name, :parent_id
  json.url manage_category_url(manage_category, format: :json)
end
