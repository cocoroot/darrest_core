require 'rails_helper'

RSpec.describe "manage/user_images/new", type: :view do
  before(:each) do
    assign(:manage_user_image, Manage::UserImage.new(
      :user => nil,
      :image => "MyString",
      :in_use => false
    ))
  end

  it "renders new manage_user_image form" do
    render

    assert_select "form[action=?][method=?]", manage_user_images_path, "post" do

      assert_select "input#manage_user_image_user_id[name=?]", "manage_user_image[user_id]"

      assert_select "input#manage_user_image_image[name=?]", "manage_user_image[image]"

      assert_select "input#manage_user_image_in_use[name=?]", "manage_user_image[in_use]"
    end
  end
end
