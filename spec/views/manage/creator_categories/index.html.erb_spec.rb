require 'rails_helper'

RSpec.describe "manage/creator_categories/index", type: :view do
  before(:each) do
    assign(:manage_creator_categories, [
      Manage::CreatorCategory.create!(
        :creator => nil,
        :category => nil
      ),
      Manage::CreatorCategory.create!(
        :creator => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of manage/creator_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
