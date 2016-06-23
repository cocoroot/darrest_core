json.creation_image do
  json.partial! partial: 'creation_image', locals: { creation_image: @result[:creation_image] }
end
