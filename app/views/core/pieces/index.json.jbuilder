json.array!(@core_pieces) do |core_piece|
  json.extract! core_piece, :id, :creation_id, :name, :description, :file_name, :format, :image
  json.url core_piece_url(core_piece, format: :json)
end
