json.array!(@sites) do |site|
  json.extract! site, :id, :name, :url, :access_key
  json.url site_url(site, format: :json)
end
