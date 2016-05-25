json.array!(@site_users) do |site_user|
  json.extract! site_user, :id, :sid, :site_id, :biography, :tos_accepted, :site_user_status_id
  json.url site_user_url(site_user, format: :json)
end
