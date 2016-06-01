require 'rails_helper'

RSpec.describe "site_user_header_images/show", type: :view do
  before(:each) do
    @site_user_header_image = assign(:site_user_header_image, SiteUserHeaderImage.create!(
      :site_user => nil,
      :image => "Image",
      :image_name_for_user => "Image Name For User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Image Name For User/)
  end
end
