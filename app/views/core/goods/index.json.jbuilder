json.array!(@core_goods) do |core_good|
  json.extract! core_good, :id, :creation_id, :user_id
  json.url core_good_url(core_good, format: :json)
end
