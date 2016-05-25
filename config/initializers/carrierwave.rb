# coding: utf-8
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  case Rails.env
  when 'test'
    config.cache_storage = :file
  when 'development' then
    config.cache_storage = :fog
    config.fog_directory = 'darrest-core-dev'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/darrest-core-dev'
  when 'staging' then
    config.cache_storage = :fog
    config.fog_directory = 'darrest-core-stg'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/darrest-core-stg'
  when 'production' then
    config.cache_storage = :fog
    config.fog_directory = 'darrest-core'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/darrest-core'
  else
    fail 'unkwown environment.'
  end
end
