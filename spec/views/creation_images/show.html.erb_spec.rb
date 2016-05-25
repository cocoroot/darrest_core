require 'rails_helper'

RSpec.describe "creation_images/show", type: :view do
  before(:each) do
    @creation_image = assign(:creation_image, CreationImage.create!(
      :creation => nil,
      :image => "Image",
      :image_name_for_user => "Image Name For User",
      :order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Image Name For User/)
    expect(rendered).to match(/1/)
  end
end
