require 'rails_helper'

RSpec.describe "manage/creator_tags/index", type: :view do
  before(:each) do
    assign(:manage_creator_tags, [
      Manage::CreatorTag.create!(
        :creator => nil,
        :tag => nil
      ),
      Manage::CreatorTag.create!(
        :creator => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of manage/creator_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
