json.user do
  json.extract! @result[:user], :id, :baas_id, :created_at, :updated_at
end
