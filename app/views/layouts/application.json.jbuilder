if @result[:errors].empty?
  JSON.parse(yield).each do |k, v|
    json.set! k, v
  end
else
  json.errors @result[:errors]
end
json.warnings @result[:warnings] unless @result[:warnings].empty?
