FactoryGirl.define do
  factory :core_creator_image, class: 'Core::CreatorImage' do
    creator nil
    sequence(:image) { |n| "test-creator-image-%05d.jpg" % n}
    in_use false
  end
end
