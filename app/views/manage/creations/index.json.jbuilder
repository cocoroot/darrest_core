json.array!(@manage_creations) do |manage_creation|
  json.extract! manage_creation, :id, :sid, :creator_id, :title, :description, :license_code
  json.url manage_creation_url(manage_creation, format: :json)
end
