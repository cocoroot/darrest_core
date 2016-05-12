require 'rails_helper'

RSpec.describe "core/user_images/edit", type: :view do
  before(:each) do
    @core_user_image = assign(:core_user_image, Core::UserImage.create!(
      :user => nil,
      :image => "MyString",
      :in_user => false
    ))
  end

  it "renders the edit core_user_image form" do
    render

    assert_select "form[action=?][method=?]", core_user_image_path(@core_user_image), "post" do

      assert_select "input#core_user_image_user_id[name=?]", "core_user_image[user_id]"

      assert_select "input#core_user_image_image[name=?]", "core_user_image[image]"

      assert_select "input#core_user_image_in_user[name=?]", "core_user_image[in_user]"
    end
  end
end
