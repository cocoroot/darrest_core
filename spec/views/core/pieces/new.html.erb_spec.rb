require 'rails_helper'

RSpec.describe "core/pieces/new", type: :view do
  before(:each) do
    assign(:core_piece, Core::Piece.new(
      :creation => nil,
      :name => "MyString",
      :description => "MyText",
      :file_name => "MyText",
      :format => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new core_piece form" do
    render

    assert_select "form[action=?][method=?]", core_pieces_path, "post" do

      assert_select "input#core_piece_creation_id[name=?]", "core_piece[creation_id]"

      assert_select "input#core_piece_name[name=?]", "core_piece[name]"

      assert_select "textarea#core_piece_description[name=?]", "core_piece[description]"

      assert_select "textarea#core_piece_file_name[name=?]", "core_piece[file_name]"

      assert_select "input#core_piece_format[name=?]", "core_piece[format]"

      assert_select "input#core_piece_image[name=?]", "core_piece[image]"
    end
  end
end
