# coding: utf-8
FactoryGirl.define do
  factory :core_tag, class: 'Core::Tag' do
    sequence(:name) { |n| "テストタグ-%04d" % n}
  end
end
