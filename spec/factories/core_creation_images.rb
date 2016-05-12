FactoryGirl.define do
  factory :core_creation_image, class: 'Core::CreationImage' do
    creation nil
    sequence(:image) { |n| "test-creation-image-%05d.jpg" % n }
  end
end
