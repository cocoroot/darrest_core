# coding: utf-8
class CreationPieceFileUploader < UploaderBase
  include CarrierWave::Magic
  process set_magic_content_type: [true]

  def store_dir
    "creations/#{model.creation_id}/creation_pieces/#{mounted_as.to_s.pluralize}"
  end

  def extension_white_list
    %w(jpg jpeg gif png bmp tiff stl zip tar.gz tar.bz2)
  end

  def filename
    # rake から呼び出される事も考慮して present? は使用しない
    if !original_filename.nil? && !original_filename.empty?
      file_name_hash = secure_token
      extname = File.extname(original_filename)
      model.file_name_for_user = File.basename(original_filename, File.extname(original_filename)) + '.jpg'
      model.format = extname
      "#{file_name_hash}#{extname}"
    end
  end
end
