require 'rails_helper'

RSpec.describe "core/user_images/index", type: :view do
  before(:each) do
    assign(:core_user_images, [
      Core::UserImage.create!(
        :user => nil,
        :image => "Image",
        :in_user => false
      ),
      Core::UserImage.create!(
        :user => nil,
        :image => "Image",
        :in_user => false
      )
    ])
  end

  it "renders a list of core/user_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
