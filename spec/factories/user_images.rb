FactoryGirl.define do
  factory :user_image do
    user nil
    sequence(:image) { |n| "test-user-image-%05d.jpg" % n }
    in_use false
  end
end
