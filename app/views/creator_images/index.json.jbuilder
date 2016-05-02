json.array!(@creator_images) do |creator_image|
  json.extract! creator_image, :id, :creator_id, :image, :in_use
  json.url creator_image_url(creator_image, format: :json)
end
