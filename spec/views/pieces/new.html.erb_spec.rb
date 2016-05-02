require 'rails_helper'

RSpec.describe "pieces/new", type: :view do
  before(:each) do
    assign(:piece, Piece.new(
      :creation => nil,
      :name => "MyString",
      :description => "MyText",
      :file_name => "MyText",
      :format => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new piece form" do
    render

    assert_select "form[action=?][method=?]", pieces_path, "post" do

      assert_select "input#piece_creation_id[name=?]", "piece[creation_id]"

      assert_select "input#piece_name[name=?]", "piece[name]"

      assert_select "textarea#piece_description[name=?]", "piece[description]"

      assert_select "textarea#piece_file_name[name=?]", "piece[file_name]"

      assert_select "input#piece_format[name=?]", "piece[format]"

      assert_select "input#piece_image[name=?]", "piece[image]"
    end
  end
end
