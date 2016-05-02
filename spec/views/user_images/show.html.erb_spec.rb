require 'rails_helper'

RSpec.describe "user_images/show", type: :view do
  before(:each) do
    @user_image = assign(:user_image, UserImage.create!(
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
