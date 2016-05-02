json.array!(@creation_images) do |creation_image|
  json.extract! creation_image, :id, :creation_id, :image
  json.url creation_image_url(creation_image, format: :json)
end
