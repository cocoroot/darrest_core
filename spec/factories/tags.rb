# coding: utf-8
FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "テストタグ-%04d" % n}
  end
end
