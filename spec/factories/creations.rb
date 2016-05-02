# coding: utf-8
FactoryGirl.define do
  factory :creation do
    sequence(:sid) { |n| "%05x" % n }
    creator nil
    sequence(:title) { |n| "テストクリエーション%05d" % n}
    sequence(:description) { |n| "Test Creation Test %05d\nテストファブリケーション説明\n" % n }
    sequence(:license_code) { |n| "license-%010x" % n }
  end
end
