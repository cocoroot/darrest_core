FactoryGirl.define do
  factory :core_user, class: 'Core::User' do
    sequence(:baas_id) { |n| "%08x-%04x-%04x-%04x-%012x" % [n, n, n, n, n] }
  end
end
