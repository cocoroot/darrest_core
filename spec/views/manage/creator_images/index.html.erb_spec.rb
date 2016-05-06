require 'rails_helper'

RSpec.describe "manage/creator_images/index", type: :view do
  before(:each) do
    assign(:manage_creator_images, [
      Manage::CreatorImage.create!(
        :creator => nil,
        :image => "Image",
        :in_use => false
      ),
      Manage::CreatorImage.create!(
        :creator => nil,
        :image => "Image",
        :in_use => false
      )
    ])
  end

  it "renders a list of manage/creator_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
