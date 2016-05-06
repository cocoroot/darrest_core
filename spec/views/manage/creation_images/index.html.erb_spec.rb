require 'rails_helper'

RSpec.describe "manage/creation_images/index", type: :view do
  before(:each) do
    assign(:manage_creation_images, [
      Manage::CreationImage.create!(
        :creation => nil,
        :image => "Image"
      ),
      Manage::CreationImage.create!(
        :creation => nil,
        :image => "Image"
      )
    ])
  end

  it "renders a list of manage/creation_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
