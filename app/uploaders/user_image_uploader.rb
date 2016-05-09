class UserImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :fog
  process convert: 'jpg'

  def store_dir
    "user-images/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    file_name_hash = secure_token
    "#{file_name_hash}.jpg" if original_filename.present?
  end

  def cache_dir
    'cache'
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
