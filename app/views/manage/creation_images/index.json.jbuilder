json.array!(@manage_creation_images) do |manage_creation_image|
  json.extract! manage_creation_image, :id, :creation_id, :image
  json.url manage_creation_image_url(manage_creation_image, format: :json)
end
