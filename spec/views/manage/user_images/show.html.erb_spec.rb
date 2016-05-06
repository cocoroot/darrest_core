require 'rails_helper'

RSpec.describe "manage/user_images/show", type: :view do
  before(:each) do
    @manage_user_image = assign(:manage_user_image, Manage::UserImage.create!(
      :user => nil,
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
