FactoryGirl.define do
  factory :collection do
    sequence(:sid) { |n| "%010x" % n }
    user nil
    sequence(:title) { |n| "title-%05d" % n }
  end
end
