class CreationPieceImageUploader < UploaderBase
  include CarrierWave::RMagick
  process convert: 'jpg'

  def store_dir
    "creation-piece-images/CREATION_PIECE:#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [144, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    file_name_hash = secure_token
    model.image_name_for_user = original_filename
    "#{file_name_hash}.jpg" if original_filename.present?
  end
end
