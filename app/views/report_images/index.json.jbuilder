json.array!(@report_images) do |report_image|
  json.extract! report_image, :id, :report_id, :image
  json.url report_image_url(report_image, format: :json)
end
