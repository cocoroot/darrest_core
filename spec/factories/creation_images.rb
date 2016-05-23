FactoryGirl.define do
  factory :creation_image do
    creation
    sequence(:image) { |n| "image#{format('%03d', n)}.jpg" }
    sequence(:order) { |n| n }
  end
end
