# coding: utf-8
FactoryGirl.define do
  factory :core_creator, class: 'Core::Creator' do
    sequence(:sid) { |n| "%010x" % n }
    user nil
    sequence(:name) { |n| "Test Creator%05d" % n}
    sequence(:description) { |n| "Test Creator Description%05d\nクリエイター説明\nテスト" % n}
  end
end
