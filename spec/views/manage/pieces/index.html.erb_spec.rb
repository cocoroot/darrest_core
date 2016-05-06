require 'rails_helper'

RSpec.describe "manage/pieces/index", type: :view do
  before(:each) do
    assign(:manage_pieces, [
      Manage::Piece.create!(
        :creation => nil,
        :name => "Name",
        :description => "MyText",
        :file_name => "MyText",
        :format => "Format",
        :image => "Image"
      ),
      Manage::Piece.create!(
        :creation => nil,
        :name => "Name",
        :description => "MyText",
        :file_name => "MyText",
        :format => "Format",
        :image => "Image"
      )
    ])
  end

  it "renders a list of manage/pieces" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
