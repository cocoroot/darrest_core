json.array!(@creator_categories) do |creator_category|
  json.extract! creator_category, :id, :creator_id, :category_id
  json.url creator_category_url(creator_category, format: :json)
end
