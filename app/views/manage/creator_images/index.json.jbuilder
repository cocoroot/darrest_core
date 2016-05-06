json.array!(@manage_creator_images) do |manage_creator_image|
  json.extract! manage_creator_image, :id, :creator_id, :image, :in_use
  json.url manage_creator_image_url(manage_creator_image, format: :json)
end
