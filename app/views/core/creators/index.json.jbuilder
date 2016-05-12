json.array!(@core_creators) do |core_creator|
  json.extract! core_creator, :id, :sid, :user_id, :name, :description
  json.url core_creator_url(core_creator, format: :json)
end
