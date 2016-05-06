require 'rails_helper'

RSpec.describe "manage/creation_images/show", type: :view do
  before(:each) do
    @manage_creation_image = assign(:manage_creation_image, Manage::CreationImage.create!(
      :creation => nil,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
  end
end
