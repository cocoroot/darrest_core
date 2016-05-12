json.array!(@core_reports) do |core_report|
  json.extract! core_report, :id, :creation_id, :user_id, :title, :detail
  json.url core_report_url(core_report, format: :json)
end
