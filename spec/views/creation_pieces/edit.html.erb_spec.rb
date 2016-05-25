require 'rails_helper'

RSpec.describe "creation_pieces/edit", type: :view do
  before(:each) do
    @creation_piece = assign(:creation_piece, CreationPiece.create!(
      :creation => nil,
      :name => "MyString",
      :description => "MyString",
      :file => "MyString",
      :file_name_for_user => "MyString",
      :image => "MyString",
      :image_name_for_user{256} => "MyString"
    ))
  end

  it "renders the edit creation_piece form" do
    render

    assert_select "form[action=?][method=?]", creation_piece_path(@creation_piece), "post" do

      assert_select "input#creation_piece_creation_id[name=?]", "creation_piece[creation_id]"

      assert_select "input#creation_piece_name[name=?]", "creation_piece[name]"

      assert_select "input#creation_piece_description[name=?]", "creation_piece[description]"

      assert_select "input#creation_piece_file[name=?]", "creation_piece[file]"

      assert_select "input#creation_piece_file_name_for_user[name=?]", "creation_piece[file_name_for_user]"

      assert_select "input#creation_piece_image[name=?]", "creation_piece[image]"

      assert_select "input#creation_piece_image_name_for_user{256}[name=?]", "creation_piece[image_name_for_user{256}]"
    end
  end
end
