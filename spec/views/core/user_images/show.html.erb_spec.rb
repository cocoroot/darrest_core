require 'rails_helper'

RSpec.describe "core/user_images/show", type: :view do
  before(:each) do
    @core_user_image = assign(:core_user_image, Core::UserImage.create!(
      :user => nil,
      :image => "Image",
      :in_user => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/false/)
  end
end
