require 'rails_helper'

RSpec.describe "creator_images/index", type: :view do
  before(:each) do
    assign(:creator_images, [
      CreatorImage.create!(
        :creator => nil,
        :image => "Image",
        :in_use => false
      ),
      CreatorImage.create!(
        :creator => nil,
        :image => "Image",
        :in_use => false
      )
    ])
  end

  it "renders a list of creator_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
