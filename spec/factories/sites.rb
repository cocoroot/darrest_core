# coding: utf-8
FactoryGirl.define do
  factory :site do
    sequence(:name) { |n| "サイト#{format('%03d', n)}" }
    sequence(:url) { |n| "http://dummy#{format('%03d', n)}.dreg.dnp.co.jp" }
  end
end
