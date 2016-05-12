require 'rails_helper'

RSpec.describe "core/creator_images/show", type: :view do
  before(:each) do
    @core_creator_image = assign(:core_creator_image, Core::CreatorImage.create!(
      :creator => nil,
      :image => "Image",
      :in_use => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
  end
end
