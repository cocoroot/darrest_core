json.array!(@manage_reports) do |manage_report|
  json.extract! manage_report, :id, :creation_id, :user_id, :title, :detail
  json.url manage_report_url(manage_report, format: :json)
end
