include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :site_user_image do
    site_user
    image { fixture_file_upload('spec/factories/resources/img/frog01.jpg') }
    image_name_for_user 'my_image_name.jpg'
  end
end
