class CreationImageUploader < UploaderBase
  include CarrierWave::RMagick
  process convert: 'jpg'

  def store_dir
    "creation-images/CREATION:#{model.creation_id}"
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    file_name_hash = secure_token
    model.image_name_for_user = original_filename if original_filename.present?
    "#{file_name_hash}.jpg" if original_filename.present?
  end
end
