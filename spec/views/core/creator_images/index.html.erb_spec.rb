require 'rails_helper'

RSpec.describe "core/creator_images/index", type: :view do
  before(:each) do
    assign(:core_creator_images, [
      Core::CreatorImage.create!(
        :creator => nil,
        :image => "Image",
        :in_use => false
      ),
      Core::CreatorImage.create!(
        :creator => nil,
        :image => "Image",
        :in_use => false
      )
    ])
  end

  it "renders a list of core/creator_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
