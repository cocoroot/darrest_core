json.array!(@site_user_statuses) do |site_user_status|
  json.extract! site_user_status, :id, :name
  json.url site_user_status_url(site_user_status, format: :json)
end
