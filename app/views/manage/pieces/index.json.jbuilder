json.array!(@manage_pieces) do |manage_piece|
  json.extract! manage_piece, :id, :creation_id, :name, :description, :file_name, :format, :image
  json.url manage_piece_url(manage_piece, format: :json)
end
