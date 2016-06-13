json.goods do
  json.partial! partial: '/creations/creation', collection: @result[:goods], as: :creation
end
