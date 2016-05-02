FactoryGirl.define do
  factory :creator_image do
    creator nil
    sequence(:image) { |n| "test-creator-image-%05d.jpg" % n}
    in_use false
  end
end
