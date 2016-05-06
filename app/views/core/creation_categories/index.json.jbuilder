json.array!(@core_creation_categories) do |core_creation_category|
  json.extract! core_creation_category, :id, :creation_id, :category_id
  json.url core_creation_category_url(core_creation_category, format: :json)
end
