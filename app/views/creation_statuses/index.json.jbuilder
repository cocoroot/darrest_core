json.array!(@creation_statuses) do |creation_status|
  json.extract! creation_status, :id, :name
  json.url creation_status_url(creation_status, format: :json)
end
