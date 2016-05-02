FactoryGirl.define do
  factory :creation_image do
    creation nil
    sequence(:image) { |n| "test-creation-image-%05d.jpg" % n }
  end
end
