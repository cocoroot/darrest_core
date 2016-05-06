FactoryGirl.define do
  factory :manage_user_image, class: 'Manage::UserImage' do
    user nil
    image "MyString"
    in_user false
  end
end
