# coding: utf-8
FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "タグ名#{format('%03d', n)}" }
    tag_class TagClass::USERS
    site
  end
end
