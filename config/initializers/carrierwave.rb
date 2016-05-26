# coding: utf-8
CarrierWave.configure do |config|
  case Rails.env
  when 'test' then
    storage = :file
    root = "#{Rails.root}/uploads/test"
  when 'development' then
    storage = :file
    root = "#{Rails.root}/uploads/dev"
  when 'staging' then
    storage = :fog
    fog_directory = 'darrest-core-stg'
  when 'production' then
    storage = :fog
    fog_directory = 'darrest-core'
  else
    fail 'unkwown environment.'
  end

  config.cache_storage = storage if storage
  config.root = root if root
  config.fog_directory = fog_directory if fog_directory

  if storage == :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/#{fog_directory}"
  end
end
