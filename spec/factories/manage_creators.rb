FactoryGirl.define do
  factory :manage_creator, class: 'Manage::Creator' do
    sid "MyString"
    user nil
    name "MyString"
    description "MyText"
  end
end
