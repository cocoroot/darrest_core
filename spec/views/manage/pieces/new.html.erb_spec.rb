require 'rails_helper'

RSpec.describe "manage/pieces/new", type: :view do
  before(:each) do
    assign(:manage_piece, Manage::Piece.new(
      :creation => nil,
      :name => "MyString",
      :description => "MyText",
      :file_name => "MyText",
      :format => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new manage_piece form" do
    render

    assert_select "form[action=?][method=?]", manage_pieces_path, "post" do

      assert_select "input#manage_piece_creation_id[name=?]", "manage_piece[creation_id]"

      assert_select "input#manage_piece_name[name=?]", "manage_piece[name]"

      assert_select "textarea#manage_piece_description[name=?]", "manage_piece[description]"

      assert_select "textarea#manage_piece_file_name[name=?]", "manage_piece[file_name]"

      assert_select "input#manage_piece_format[name=?]", "manage_piece[format]"

      assert_select "input#manage_piece_image[name=?]", "manage_piece[image]"
    end
  end
end
