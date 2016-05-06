json.array!(@manage_creator_categories) do |manage_creator_category|
  json.extract! manage_creator_category, :id, :creator_id, :category_id
  json.url manage_creator_category_url(manage_creator_category, format: :json)
end
