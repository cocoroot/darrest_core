require 'rails_helper'

RSpec.describe "manage/user_images/index", type: :view do
  before(:each) do
    assign(:manage_user_images, [
      Manage::UserImage.create!(
        :user => nil,
        :image => "Image",
        :in_user => false
      ),
      Manage::UserImage.create!(
        :user => nil,
        :image => "Image",
        :in_user => false
      )
    ])
  end

  it "renders a list of manage/user_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
