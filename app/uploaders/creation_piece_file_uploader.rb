class CreationPieceFileUploader < UploaderBase
  include CarrierWave::Magic
  process set_magic_content_type: [true]

  def store_dir
    "creation-piece-files/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png bmp tiff stl zip tar.gz tar.bz2)
  end

  def filename
    file_name_hash = secure_token
    extname = File.extname(original_filename)
    model.file_name_for_user = original_filename if original_filename.present?
    "#{file_name_hash}#{extname}" if original_filename.present?
  end
end
