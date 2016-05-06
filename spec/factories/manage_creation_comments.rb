FactoryGirl.define do
  factory :manage_creation_comment, class: 'Manage::CreationComment' do
    sid "MyString"
    creation nil
    user nil
    parent nil
    notice_code "MyString"
  end
end
