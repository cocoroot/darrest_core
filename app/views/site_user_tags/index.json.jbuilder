json.array!(@site_user_tags) do |site_user_tag|
  json.extract! site_user_tag, :id, :site_user_id, :tag_id
  json.url site_user_tag_url(site_user_tag, format: :json)
end
