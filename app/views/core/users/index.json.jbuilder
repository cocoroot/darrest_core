json.array!(@core_users) do |core_user|
  json.extract! core_user, :id, :baas_id
  json.url core_user_url(core_user, format: :json)
end
