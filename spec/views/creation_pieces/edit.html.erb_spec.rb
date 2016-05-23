require 'rails_helper'

RSpec.describe "creation_pieces/edit", type: :view do
  before(:each) do
    @creation_piece = assign(:creation_piece, CreationPiece.create!(
      :creation => nil,
      :name => "MyString",
      :description => "MyString",
      :file_name => "MyString",
      :format => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit creation_piece form" do
    render

    assert_select "form[action=?][method=?]", creation_piece_path(@creation_piece), "post" do

      assert_select "input#creation_piece_creation_id[name=?]", "creation_piece[creation_id]"

      assert_select "input#creation_piece_name[name=?]", "creation_piece[name]"

      assert_select "input#creation_piece_description[name=?]", "creation_piece[description]"

      assert_select "input#creation_piece_file_name[name=?]", "creation_piece[file_name]"

      assert_select "input#creation_piece_format[name=?]", "creation_piece[format]"

      assert_select "input#creation_piece_image[name=?]", "creation_piece[image]"
    end
  end
end
