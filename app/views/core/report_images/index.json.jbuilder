json.array!(@core_report_images) do |core_report_image|
  json.extract! core_report_image, :id, :report_id, :image
  json.url core_report_image_url(core_report_image, format: :json)
end
