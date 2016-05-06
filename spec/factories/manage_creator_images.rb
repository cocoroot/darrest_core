FactoryGirl.define do
  factory :manage_creator_image, class: 'Manage::CreatorImage' do
    creator nil
    image "MyString"
    in_use false
  end
end
