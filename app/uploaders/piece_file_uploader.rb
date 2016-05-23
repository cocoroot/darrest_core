class CreationPieceFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::Magic

  storage :fog
  process set_magic_content_type: [true]

  def store_dir
    "creation-piece-files/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png bmp tiff stl zip tar.gz tar.bz2)
  end

  def cache_dir
    'cache'
  end
end
