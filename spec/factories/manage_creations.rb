FactoryGirl.define do
  factory :manage_creation, class: 'Manage::Creation' do
    sid "MyString"
    creator nil
    title "MyString"
    description "MyText"
    license_code "MyString"
  end
end
