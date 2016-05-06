require 'rails_helper'

RSpec.describe "core/creator_images/edit", type: :view do
  before(:each) do
    @core_creator_image = assign(:core_creator_image, Core::CreatorImage.create!(
      :creator => nil,
      :image => "MyString",
      :in_use => false
    ))
  end

  it "renders the edit core_creator_image form" do
    render

    assert_select "form[action=?][method=?]", core_creator_image_path(@core_creator_image), "post" do

      assert_select "input#core_creator_image_creator_id[name=?]", "core_creator_image[creator_id]"

      assert_select "input#core_creator_image_image[name=?]", "core_creator_image[image]"

      assert_select "input#core_creator_image_in_use[name=?]", "core_creator_image[in_use]"
    end
  end
end
