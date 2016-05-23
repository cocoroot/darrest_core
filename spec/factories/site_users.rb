# coding: utf-8
FactoryGirl.define do
  factory :site_user do
    user
    sequence(:biography) { |n| "バイオグラフィー#{format('%03d', n)}\n" * 3 }
    tos_accepted true
    site_user_status SiteUserStatus::REGISTERED
  end
end
