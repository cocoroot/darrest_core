FactoryGirl.define do
  factory :core_user_image, class: 'Core::UserImage' do
    user nil
    sequence(:image) { |n| "test-user-image-%05d.jpg" % n }
    in_use false
  end
end
