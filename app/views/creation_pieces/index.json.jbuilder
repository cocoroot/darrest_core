json.array!(@creation_pieces) do |creation_piece|
  json.extract! creation_piece, :id, :creation_id, :name, :description, :file, :file_name_for_user, :image, :image_name_for_user{256}
  json.url creation_piece_url(creation_piece, format: :json)
end
