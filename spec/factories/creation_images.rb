include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :creation_image do
    creation
    image { fixture_file_upload('spec/factories/resources/img/chess01.jpg', 'image/jpeg')}
    image_name_for_user 'my_image_name.jpg'
    sequence(:order) { |n| n }
  end
end
