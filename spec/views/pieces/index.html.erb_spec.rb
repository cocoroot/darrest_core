require 'rails_helper'

RSpec.describe "pieces/index", type: :view do
  before(:each) do
    assign(:pieces, [
      Piece.create!(
        :creation => nil,
        :name => "Name",
        :description => "MyText",
        :file_name => "MyText",
        :format => "Format",
        :image => "Image"
      ),
      Piece.create!(
        :creation => nil,
        :name => "Name",
        :description => "MyText",
        :file_name => "MyText",
        :format => "Format",
        :image => "Image"
      )
    ])
  end

  it "renders a list of pieces" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
