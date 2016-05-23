require 'rails_helper'

RSpec.describe "creation_pieces/index", type: :view do
  before(:each) do
    assign(:creation_pieces, [
      CreationPiece.create!(
        :creation => nil,
        :name => "Name",
        :description => "Description",
        :file_name => "File Name",
        :format => "Format",
        :image => "Image"
      ),
      CreationPiece.create!(
        :creation => nil,
        :name => "Name",
        :description => "Description",
        :file_name => "File Name",
        :format => "Format",
        :image => "Image"
      )
    ])
  end

  it "renders a list of creation_pieces" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Format".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
