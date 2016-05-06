# coding: utf-8
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  config.cache_storage = :fog
  config.fog_directory = 'darrest-core-dev'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/darrest-core-dev'

  # Rails.env に応じて directory, host を変えるのも良い
end
