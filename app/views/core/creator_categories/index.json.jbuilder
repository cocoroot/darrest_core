json.array!(@core_creator_categories) do |core_creator_category|
  json.extract! core_creator_category, :id, :creator_id, :category_id
  json.url core_creator_category_url(core_creator_category, format: :json)
end
