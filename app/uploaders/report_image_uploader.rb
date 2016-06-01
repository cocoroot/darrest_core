# coding: utf-8
class ReportImageUploader < UploaderBase
  include CarrierWave::RMagick
  process convert: 'jpg'

  def store_dir
    "reports/#{model.report_id}/reports_images"
  end

  version :thumb do
    process resize_to_fit: [144, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    # rake から呼び出される事も考慮して present? は使用しない
    if !original_filename.nil? && !original_filename.empty?
      file_name_hash = secure_token
      model.image_name_for_user = original_filename
      "#{file_name_hash}.jpg"
    end
  end
end
