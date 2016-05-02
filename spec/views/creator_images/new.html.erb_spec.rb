require 'rails_helper'

RSpec.describe "creator_images/new", type: :view do
  before(:each) do
    assign(:creator_image, CreatorImage.new(
      :creator => nil,
      :image => "MyString",
      :in_use => false
    ))
  end

  it "renders new creator_image form" do
    render

    assert_select "form[action=?][method=?]", creator_images_path, "post" do

      assert_select "input#creator_image_creator_id[name=?]", "creator_image[creator_id]"

      assert_select "input#creator_image_image[name=?]", "creator_image[image]"

      assert_select "input#creator_image_in_use[name=?]", "creator_image[in_use]"
    end
  end
end
