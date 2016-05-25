require 'rails_helper'

RSpec.describe "site_user_images/edit", type: :view do
  before(:each) do
    @site_user_image = assign(:site_user_image, SiteUserImage.create!(
      :site_user => nil,
      :image => "MyString",
      :image_name_for_user => "MyString",
      :in_use => false,
      :order => 1
    ))
  end

  it "renders the edit site_user_image form" do
    render

    assert_select "form[action=?][method=?]", site_user_image_path(@site_user_image), "post" do

      assert_select "input#site_user_image_site_user_id[name=?]", "site_user_image[site_user_id]"

      assert_select "input#site_user_image_image[name=?]", "site_user_image[image]"

      assert_select "input#site_user_image_image_name_for_user[name=?]", "site_user_image[image_name_for_user]"

      assert_select "input#site_user_image_in_use[name=?]", "site_user_image[in_use]"

      assert_select "input#site_user_image_order[name=?]", "site_user_image[order]"
    end
  end
end
