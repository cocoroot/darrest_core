json.good do
  json.partial! partial: 'good', locals: { creation: @result[:creation] }
end
