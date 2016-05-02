json.array!(@creators) do |creator|
  json.extract! creator, :id, :sid, :user_id, :name, :description
  json.url creator_url(creator, format: :json)
end
