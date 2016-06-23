json.creation_images do
  json.partial! partial: 'creation_image', collection: @result[:creation_images], as: :creation_image
end
