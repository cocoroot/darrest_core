class FileUploaderBase < CarrierWave::Uploader::Base
  extend ActiveSupport::Concern
  storage :file
  
  # extended do
  #   case Rails.env
  #   when 'test', 'development' then
  #     puts 'FileUploaderBase CarrierWave storage :file'
  #     storage :file
  #   when 'staging', 'production' then
  #     puts 'FileUploaderBase CarrierWave storage :fog'
  #     storage :fog
  #   else
  #     fail 'unknown environment.'
  #   end
  # end

  def cache_dir
    'cache'
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
