json.array!(@creations) do |creation|
  json.extract! creation, :id, :sid, :creator_id, :title, :description, :license_code
  json.url creation_url(creation, format: :json)
end
