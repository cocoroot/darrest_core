require 'rails_helper'

RSpec.describe "creator_images/edit", type: :view do
  before(:each) do
    @creator_image = assign(:creator_image, CreatorImage.create!(
      :creator => nil,
      :image => "MyString",
      :in_use => false
    ))
  end

  it "renders the edit creator_image form" do
    render

    assert_select "form[action=?][method=?]", creator_image_path(@creator_image), "post" do

      assert_select "input#creator_image_creator_id[name=?]", "creator_image[creator_id]"

      assert_select "input#creator_image_image[name=?]", "creator_image[image]"

      assert_select "input#creator_image_in_use[name=?]", "creator_image[in_use]"
    end
  end
end
