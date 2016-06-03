# coding: utf-8
FactoryGirl.define do
  factory :creation_comment do
    creation
    site_user
    sequence(:body) { |n| "コメント本文#{format('%03d', n)}" * 3 }
    parent nil
    notice_code 'dummy_code'
  end
end

