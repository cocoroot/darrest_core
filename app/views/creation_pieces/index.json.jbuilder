json.array!(@creation_pieces) do |creation_piece|
  json.extract! creation_piece, :id, :creation_id, :name, :description, :file_name, :format, :image
  json.url creation_piece_url(creation_piece, format: :json)
end
