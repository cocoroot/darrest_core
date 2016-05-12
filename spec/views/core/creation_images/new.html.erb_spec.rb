require 'rails_helper'

RSpec.describe "core/creation_images/new", type: :view do
  before(:each) do
    assign(:core_creation_image, Core::CreationImage.new(
      :creation => nil,
      :image => "MyString"
    ))
  end

  it "renders new core_creation_image form" do
    render

    assert_select "form[action=?][method=?]", core_creation_images_path, "post" do

      assert_select "input#core_creation_image_creation_id[name=?]", "core_creation_image[creation_id]"

      assert_select "input#core_creation_image_image[name=?]", "core_creation_image[image]"
    end
  end
end
