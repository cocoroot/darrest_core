json.array!(@core_creations) do |core_creation|
  json.extract! core_creation, :id, :sid, :creator_id, :title, :description, :license_code
  json.url core_creation_url(core_creation, format: :json)
end
