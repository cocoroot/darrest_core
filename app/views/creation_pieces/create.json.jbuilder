json.creation_pieces do
  json.partial! partial: 'creation_piece', collection: @result[:creation_pieces], as: :creation_piece
end
