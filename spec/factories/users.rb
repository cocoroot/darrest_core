require 'securerandom'

FactoryGirl.define do
  factory :user do
    baas_id { SecureRandom.uuid }
  end
end
