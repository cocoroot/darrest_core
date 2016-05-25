require 'rails_helper'

RSpec.describe "creation_images/index", type: :view do
  before(:each) do
    assign(:creation_images, [
      CreationImage.create!(
        :creation => nil,
        :image => "Image",
        :image_name_for_user => "Image Name For User",
        :order => 1
      ),
      CreationImage.create!(
        :creation => nil,
        :image => "Image",
        :image_name_for_user => "Image Name For User",
        :order => 1
      )
    ])
  end

  it "renders a list of creation_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Image Name For User".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
