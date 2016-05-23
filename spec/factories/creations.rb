# coding: utf-8
FactoryGirl.define do
  factory :creation do
    sid nil
    site_user
    sequence(:title) { |n| "クリエイションタイトル#{format('%03d', n)}" }
    sequence(:description) { |n| "クリエイション内容#{format('%03d', n)}" * 3 }
    license_code 'dummy_code'
    creation_status CreationStatus::PUBLISHED
  end
end
