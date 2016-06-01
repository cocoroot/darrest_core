require 'rails_helper'

RSpec.describe "site_user_header_images/new", type: :view do
  before(:each) do
    assign(:site_user_header_image, SiteUserHeaderImage.new(
      :site_user => nil,
      :image => "MyString",
      :image_name_for_user => "MyString"
    ))
  end

  it "renders new site_user_header_image form" do
    render

    assert_select "form[action=?][method=?]", site_user_header_images_path, "post" do

      assert_select "input#site_user_header_image_site_user_id[name=?]", "site_user_header_image[site_user_id]"

      assert_select "input#site_user_header_image_image[name=?]", "site_user_header_image[image]"

      assert_select "input#site_user_header_image_image_name_for_user[name=?]", "site_user_header_image[image_name_for_user]"
    end
  end
end
