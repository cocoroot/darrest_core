require 'rails_helper'

RSpec.describe "core/creation_images/show", type: :view do
  before(:each) do
    @core_creation_image = assign(:core_creation_image, Core::CreationImage.create!(
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
