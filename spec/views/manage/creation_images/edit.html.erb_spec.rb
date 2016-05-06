require 'rails_helper'

RSpec.describe "manage/creation_images/edit", type: :view do
  before(:each) do
    @manage_creation_image = assign(:manage_creation_image, Manage::CreationImage.create!(
      :creation => nil,
      :image => "MyString"
    ))
  end

  it "renders the edit manage_creation_image form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_image_path(@manage_creation_image), "post" do

      assert_select "input#manage_creation_image_creation_id[name=?]", "manage_creation_image[creation_id]"

      assert_select "input#manage_creation_image_image[name=?]", "manage_creation_image[image]"
    end
  end
end
