FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "test category %05d" % n }
    parent nil
  end
end
