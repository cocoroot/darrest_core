require 'rails_helper'

RSpec.describe "site_user_images/new", type: :view do
  before(:each) do
    assign(:site_user_image, SiteUserImage.new(
      :site_user => nil,
      :image => "MyString",
      :in_use => false,
      :order => 1
    ))
  end

  it "renders new site_user_image form" do
    render

    assert_select "form[action=?][method=?]", site_user_images_path, "post" do

      assert_select "input#site_user_image_site_user_id[name=?]", "site_user_image[site_user_id]"

      assert_select "input#site_user_image_image[name=?]", "site_user_image[image]"

      assert_select "input#site_user_image_in_use[name=?]", "site_user_image[in_use]"

      assert_select "input#site_user_image_order[name=?]", "site_user_image[order]"
    end
  end
end
