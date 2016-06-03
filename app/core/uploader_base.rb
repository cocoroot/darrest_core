class UploaderBase < CarrierWave::Uploader::Base
  case Rails.env
  when 'test' then
    storage :file
  when 'development' then
    storage :file
  when 'staging' then
    storage :fog
  when 'production' then
    storage :fog
  else
    fail 'unknown environment.'
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
