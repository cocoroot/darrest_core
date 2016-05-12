json.array!(@core_creator_images) do |core_creator_image|
  json.extract! core_creator_image, :id, :creator_id, :image, :in_use
  json.url core_creator_image_url(core_creator_image, format: :json)
end
