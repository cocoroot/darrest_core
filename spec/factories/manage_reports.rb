FactoryGirl.define do
  factory :manage_report, class: 'Manage::Report' do
    creation nil
    user nil
    title "MyString"
    detail "MyText"
  end
end
