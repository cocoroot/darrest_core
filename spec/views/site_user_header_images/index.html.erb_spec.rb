require 'rails_helper'

RSpec.describe "site_user_header_images/index", type: :view do
  before(:each) do
    assign(:site_user_header_images, [
      SiteUserHeaderImage.create!(
        :site_user => nil,
        :image => "Image",
        :image_name_for_user => "Image Name For User"
      ),
      SiteUserHeaderImage.create!(
        :site_user => nil,
        :image => "Image",
        :image_name_for_user => "Image Name For User"
      )
    ])
  end

  it "renders a list of site_user_header_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Image Name For User".to_s, :count => 2
  end
end
