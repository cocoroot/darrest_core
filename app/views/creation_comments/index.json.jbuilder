json.creation_comments do
  json.partial! partial: 'creation_comment', collection: @result[:creation_comments], as: :comment
end
