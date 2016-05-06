FactoryGirl.define do
  factory :core_category, class: 'Core::Category' do
    sequence(:name) { |n| "test category %05d" % n }
    parent nil
  end
end
