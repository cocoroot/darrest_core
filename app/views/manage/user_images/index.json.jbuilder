json.array!(@manage_user_images) do |manage_user_image|
  json.extract! manage_user_image, :id, :user_id, :image, :in_use
  json.url manage_user_image_url(manage_user_image, format: :json)
end
