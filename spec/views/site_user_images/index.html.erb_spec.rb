require 'rails_helper'

RSpec.describe "site_user_images/index", type: :view do
  before(:each) do
    assign(:site_user_images, [
      SiteUserImage.create!(
        :site_user => nil,
        :image => "Image",
        :image_name_for_user => "Image Name For User",
        :in_use => false,
        :order => 1
      ),
      SiteUserImage.create!(
        :site_user => nil,
        :image => "Image",
        :image_name_for_user => "Image Name For User",
        :in_use => false,
        :order => 1
      )
    ])
  end

  it "renders a list of site_user_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Image Name For User".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
