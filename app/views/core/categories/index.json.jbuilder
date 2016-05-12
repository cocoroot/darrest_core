json.array!(@core_categories) do |core_category|
  json.extract! core_category, :id, :name, :parent_id
  json.url core_category_url(core_category, format: :json)
end
