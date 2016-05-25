require 'rails_helper'

RSpec.describe "creation_pieces/index", type: :view do
  before(:each) do
    assign(:creation_pieces, [
      CreationPiece.create!(
        :creation => nil,
        :name => "Name",
        :description => "Description",
        :file => "File",
        :file_name_for_user => "File Name For User",
        :image => "Image",
        :image_name_for_user{256} => "Image Name For User{256}"
      ),
      CreationPiece.create!(
        :creation => nil,
        :name => "Name",
        :description => "Description",
        :file => "File",
        :file_name_for_user => "File Name For User",
        :image => "Image",
        :image_name_for_user{256} => "Image Name For User{256}"
      )
    ])
  end

  it "renders a list of creation_pieces" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
    assert_select "tr>td", :text => "File Name For User".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Image Name For User{256}".to_s, :count => 2
  end
end
