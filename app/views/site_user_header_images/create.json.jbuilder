json.site_user_header_image do
  json.extract! @result[:site_user_header_image], :id, :site_user_id, :image, :image_name_for_user
end