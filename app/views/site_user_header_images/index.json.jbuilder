json.array!(@site_user_header_images) do |site_user_header_image|
  json.extract! site_user_header_image, :id, :site_user_id, :image, :image_name_for_user
  json.url site_user_header_image_url(site_user_header_image, format: :json)
end
