require 'rails_helper'

RSpec.describe "manage/creation_images/new", type: :view do
  before(:each) do
    assign(:manage_creation_image, Manage::CreationImage.new(
      :creation => nil,
      :image => "MyString"
    ))
  end

  it "renders new manage_creation_image form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_images_path, "post" do

      assert_select "input#manage_creation_image_creation_id[name=?]", "manage_creation_image[creation_id]"

      assert_select "input#manage_creation_image_image[name=?]", "manage_creation_image[image]"
    end
  end
end
