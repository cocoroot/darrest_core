require 'rails_helper'

RSpec.describe "user_images/edit", type: :view do
  before(:each) do
    @user_image = assign(:user_image, UserImage.create!(
      :user => nil,
      :image => "MyString",
      :in_user => false
    ))
  end

  it "renders the edit user_image form" do
    render

    assert_select "form[action=?][method=?]", user_image_path(@user_image), "post" do

      assert_select "input#user_image_user_id[name=?]", "user_image[user_id]"

      assert_select "input#user_image_image[name=?]", "user_image[image]"

      assert_select "input#user_image_in_user[name=?]", "user_image[in_user]"
    end
  end
end
