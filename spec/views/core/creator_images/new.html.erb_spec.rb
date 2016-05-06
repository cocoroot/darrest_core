require 'rails_helper'

RSpec.describe "core/creator_images/new", type: :view do
  before(:each) do
    assign(:core_creator_image, Core::CreatorImage.new(
      :creator => nil,
      :image => "MyString",
      :in_use => false
    ))
  end

  it "renders new core_creator_image form" do
    render

    assert_select "form[action=?][method=?]", core_creator_images_path, "post" do

      assert_select "input#core_creator_image_creator_id[name=?]", "core_creator_image[creator_id]"

      assert_select "input#core_creator_image_image[name=?]", "core_creator_image[image]"

      assert_select "input#core_creator_image_in_use[name=?]", "core_creator_image[in_use]"
    end
  end
end
