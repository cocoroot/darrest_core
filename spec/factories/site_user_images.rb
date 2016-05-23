FactoryGirl.define do
  factory :site_user_image do
    site_user
    sequence(:image) { |n| "image#{format('%03d', n)}.jpg" }
    in_use false
    sequence(:order) { |n| n }
  end
end
