json.array!(@core_user_images) do |core_user_image|
  json.extract! core_user_image, :id, :user_id, :image, :in_use
  json.url core_user_image_url(core_user_image, format: :json)
end
