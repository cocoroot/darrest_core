# coding: utf-8
FactoryGirl.define do
  factory :report do
    creation
    site_user
    sequence(:title) { |n| "レポートタイトル#{format('%03d', n)}" }
    sequence(:detail) { |n| "内容#{format('%03d', n)}\n" * 3 }
  end
end
