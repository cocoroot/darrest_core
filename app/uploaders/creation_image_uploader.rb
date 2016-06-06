# coding: utf-8
class CreationImageUploader < UploaderBase
  include CarrierWave::RMagick
  process convert: 'jpg'

  def store_dir
    "creations/#{model.creation_id}/creation_images"
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    # rake から呼び出される事も考慮して present? は使用しない
    if !original_filename.nil? && !original_filename.empty?
      file_name_hash = secure_token
      model.image_name_for_user = File.basename(original_filename, File.extname(original_filename)) + '.jpg'
      "#{file_name_hash}.jpg"
    end
  end
end
