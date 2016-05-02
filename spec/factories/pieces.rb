# coding: utf-8
FactoryGirl.define do
  factory :piece do
    creation nil
    sequence(:name) { |n| "test piece name %05d" % n }
    sequence(:description) { |n| "test description %05d\nテスト説明\ntest" % n }
    sequence(:file_name) { |n| "test-piece-file-name-%05d" % n }
    format "jpg"
    sequence(:image) { |n| "test-piece-image-name-%05d" % n }
  end
end
