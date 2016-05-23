# coding: utf-8
FactoryGirl.define do
  factory :creation_piece do
    creation
    sequence(:name) { |n| "ピース名#{format('%03d', n)}" }
    sequence(:file_name) { |n| "ファイル名#{format('%03d', n)}" }
    format 'jpg'
    sequence(:image) { |n| "image#{format('%03d', n)}.jpg" }
  end
end
