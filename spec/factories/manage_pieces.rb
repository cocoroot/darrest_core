FactoryGirl.define do
  factory :manage_piece, class: 'Manage::Piece' do
    creation nil
    name "MyString"
    description "MyText"
    file_name "MyText"
    format "MyString"
    image "MyString"
  end
end
