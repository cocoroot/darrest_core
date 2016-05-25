# coding: utf-8
FactoryGirl.define do
  factory :collection do
    site_user
    sequence(:title) { |n| "コレクションタイトル#{format('%03d', n)}" }
  end
end
