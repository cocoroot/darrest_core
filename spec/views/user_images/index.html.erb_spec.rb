require 'rails_helper'

RSpec.describe "user_images/index", type: :view do
  before(:each) do
    assign(:user_images, [
      UserImage.create!(
        :user => nil,
        :image => "Image",
        :in_user => false
      ),
      UserImage.create!(
        :user => nil,
        :image => "Image",
        :in_user => false
      )
    ])
  end

  it "renders a list of user_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
