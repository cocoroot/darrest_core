json.array!(@reports) do |report|
  json.extract! report, :id, :creation_id, :user_id, :title, :detail
  json.url report_url(report, format: :json)
end
