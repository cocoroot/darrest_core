json.creation_tags do
  json.partial! partial: 'creation_tag', collection: @result[:creation_tags], as: :creation_tag
end
