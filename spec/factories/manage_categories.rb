FactoryGirl.define do
  factory :manage_category, class: 'Manage::Category' do
    name "MyString"
    parent_id 1
  end
end
