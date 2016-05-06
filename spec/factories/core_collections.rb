FactoryGirl.define do
  factory :core_collection, class: 'Core::Collection' do
    sequence(:sid) { |n| "%010x" % n }
    user nil
    sequence(:title) { |n| "title-%05d" % n }
  end
end
