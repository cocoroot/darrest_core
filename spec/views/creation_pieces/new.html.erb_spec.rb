require 'rails_helper'

RSpec.describe "creation_pieces/new", type: :view do
  before(:each) do
    assign(:creation_piece, CreationPiece.new(
      :creation => nil,
      :name => "MyString",
      :description => "MyString",
      :file_name => "MyString",
      :format => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new creation_piece form" do
    render

    assert_select "form[action=?][method=?]", creation_pieces_path, "post" do

      assert_select "input#creation_piece_creation_id[name=?]", "creation_piece[creation_id]"

      assert_select "input#creation_piece_name[name=?]", "creation_piece[name]"

      assert_select "input#creation_piece_description[name=?]", "creation_piece[description]"

      assert_select "input#creation_piece_file_name[name=?]", "creation_piece[file_name]"

      assert_select "input#creation_piece_format[name=?]", "creation_piece[format]"

      assert_select "input#creation_piece_image[name=?]", "creation_piece[image]"
    end
  end
end
