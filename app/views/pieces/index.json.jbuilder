json.array!(@pieces) do |piece|
  json.extract! piece, :id, :creation_id, :name, :description, :file_name, :format, :image
  json.url piece_url(piece, format: :json)
end
