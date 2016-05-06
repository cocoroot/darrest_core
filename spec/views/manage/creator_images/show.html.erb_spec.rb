require 'rails_helper'

RSpec.describe "manage/creator_images/show", type: :view do
  before(:each) do
    @manage_creator_image = assign(:manage_creator_image, Manage::CreatorImage.create!(
      :creator => nil,
      :image => "Image",
      :boolean => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(//)
  end
end
