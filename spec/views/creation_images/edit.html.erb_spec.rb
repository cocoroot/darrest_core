require 'rails_helper'

RSpec.describe "creation_images/edit", type: :view do
  before(:each) do
    @creation_image = assign(:creation_image, CreationImage.create!(
      :creation => nil,
      :image => "MyString",
      :order => 1
    ))
  end

  it "renders the edit creation_image form" do
    render

    assert_select "form[action=?][method=?]", creation_image_path(@creation_image), "post" do

      assert_select "input#creation_image_creation_id[name=?]", "creation_image[creation_id]"

      assert_select "input#creation_image_image[name=?]", "creation_image[image]"

      assert_select "input#creation_image_order[name=?]", "creation_image[order]"
    end
  end
end
