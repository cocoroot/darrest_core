FactoryGirl.define do
  factory :user do
    sequence(:baas_id) { |n| "%08x-%04x-%04x-%04x-%012x" % [n, n, n, n, n] }
  end
end
