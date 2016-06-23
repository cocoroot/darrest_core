json.creation_comment do
  json.partial! partial: 'creation_comment', locals: { comment: @result[:creation_comment] }
end
