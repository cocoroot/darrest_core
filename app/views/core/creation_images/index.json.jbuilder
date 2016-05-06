json.array!(@core_creation_images) do |core_creation_image|
  json.extract! core_creation_image, :id, :creation_id, :image
  json.url core_creation_image_url(core_creation_image, format: :json)
end
