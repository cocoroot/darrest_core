# coding: utf-8

require 'securerandom'

FactoryGirl.define do
  factory :site do
    sequence(:name) { |n| "サイト#{format('%03d', n)}" }
    sequence(:url) { |n| "http://dummy#{format('%03d', n)}.dreg.dnp.co.jp" }
    access_key { SecureRandom.uuid.upcase }
  end
end
