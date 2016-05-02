require 'rails_helper'

RSpec.describe "creation_images/new", type: :view do
  before(:each) do
    assign(:creation_image, CreationImage.new(
      :creation => nil,
      :image => "MyString"
    ))
  end

  it "renders new creation_image form" do
    render

    assert_select "form[action=?][method=?]", creation_images_path, "post" do

      assert_select "input#creation_image_creation_id[name=?]", "creation_image[creation_id]"

      assert_select "input#creation_image_image[name=?]", "creation_image[image]"
    end
  end
end
