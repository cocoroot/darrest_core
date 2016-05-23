require 'rails_helper'

RSpec.describe "site_user_images/show", type: :view do
  before(:each) do
    @site_user_image = assign(:site_user_image, SiteUserImage.create!(
      :site_user => nil,
      :image => "Image",
      :in_use => false,
      :order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
  end
end
