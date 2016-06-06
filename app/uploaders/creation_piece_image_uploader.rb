# coding: utf-8
class CreationPieceImageUploader < UploaderBase
  include CarrierWave::RMagick
  process convert: 'jpg'

  def store_dir
    "creations/#{model.creation_id}/creation_pieces/#{mounted_as.to_s.pluralize}"
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