include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :site_user_image do
    site_user
    # sequence(:image) { |n| "image#{format('%03d', n)}.jpg" }
    #image { fixture_file_upload("spec/factories/resources/img/frog01.jpg") }
    image { fixture_file_upload("spec/factories/resources/img/frog01.jpg") }
    in_use false
    sequence(:order) { |n| n }
  end
end
