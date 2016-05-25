json.array!(@creations) do |creation|
  json.extract! creation, :id, :sid, :site_id, :site_user_id, :title, :description, :license_code, :creation_status_id
  json.url creation_url(creation, format: :json)
end
