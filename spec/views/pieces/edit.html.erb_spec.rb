require 'rails_helper'

RSpec.describe "pieces/edit", type: :view do
  before(:each) do
    @piece = assign(:piece, Piece.create!(
      :creation => nil,
      :name => "MyString",
      :description => "MyText",
      :file_name => "MyText",
      :format => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit piece form" do
    render

    assert_select "form[action=?][method=?]", piece_path(@piece), "post" do

      assert_select "input#piece_creation_id[name=?]", "piece[creation_id]"

      assert_select "input#piece_name[name=?]", "piece[name]"

      assert_select "textarea#piece_description[name=?]", "piece[description]"

      assert_select "textarea#piece_file_name[name=?]", "piece[file_name]"

      assert_select "input#piece_format[name=?]", "piece[format]"

      assert_select "input#piece_image[name=?]", "piece[image]"
    end
  end
end
