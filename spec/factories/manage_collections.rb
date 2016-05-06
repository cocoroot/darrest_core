FactoryGirl.define do
  factory :manage_collection, class: 'Manage::Collection' do
    sid "MyString"
    user nil
    title "MyText"
  end
end
