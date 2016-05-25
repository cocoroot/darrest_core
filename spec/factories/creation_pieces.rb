# coding: utf-8
FactoryGirl.define do
  factory :creation_piece do
    creation
    #sequence(:name) { |n| "ピース名#{format('%03d', n)}" }
    name 'test'
    file { fixture_file_upload('spec/factories/resources/stl/test.stl') }
    file_name_for_user 'my_file_name.stl'
    format 'jpg'
    image { fixture_file_upload('spec/factories/resources/img/origami01.jpg') }
    image_name_for_user 'my_image_name.jpg'
  end
end
