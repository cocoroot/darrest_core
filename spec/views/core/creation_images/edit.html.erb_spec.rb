require 'rails_helper'

RSpec.describe "core/creation_images/edit", type: :view do
  before(:each) do
    @core_creation_image = assign(:core_creation_image, Core::CreationImage.create!(
      :creation => nil,
      :image => "MyString"
    ))
  end

  it "renders the edit core_creation_image form" do
    render

    assert_select "form[action=?][method=?]", core_creation_image_path(@core_creation_image), "post" do

      assert_select "input#core_creation_image_creation_id[name=?]", "core_creation_image[creation_id]"

      assert_select "input#core_creation_image_image[name=?]", "core_creation_image[image]"
    end
  end
end
