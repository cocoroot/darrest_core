FactoryGirl.define do
  factory :core_creation_comment, class: 'Core::CreationComment' do
    sequence(:sid) { |n| "%010x" % n }
    creation nil
    user nil
    parent nil
    sequence(:notice_code) { |n| "notice-%03d" % n }
  end
end
