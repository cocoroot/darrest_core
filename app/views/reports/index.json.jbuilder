json.array!(@reports) do |report|
  json.extract! report, :id, :creation_id, :site_user_id, :title, :detail
  json.url report_url(report, format: :json)
end
