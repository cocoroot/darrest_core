json.array!(@manage_report_images) do |manage_report_image|
  json.extract! manage_report_image, :id, :report_id, :image
  json.url manage_report_image_url(manage_report_image, format: :json)
end
