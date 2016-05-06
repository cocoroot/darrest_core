require 'rails_helper'

RSpec.describe "manage/creator_images/edit", type: :view do
  before(:each) do
    @manage_creator_image = assign(:manage_creator_image, Manage::CreatorImage.create!(
      :creator => nil,
      :image => "MyString",
      :boolean => ""
    ))
  end

  it "renders the edit manage_creator_image form" do
    render

    assert_select "form[action=?][method=?]", manage_creator_image_path(@manage_creator_image), "post" do

      assert_select "input#manage_creator_image_creator_id[name=?]", "manage_creator_image[creator_id]"

      assert_select "input#manage_creator_image_image[name=?]", "manage_creator_image[image]"

      assert_select "input#manage_creator_image_boolean[name=?]", "manage_creator_image[boolean]"
    end
  end
end
