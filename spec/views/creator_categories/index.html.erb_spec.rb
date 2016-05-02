require 'rails_helper'

RSpec.describe "creator_categories/index", type: :view do
  before(:each) do
    assign(:creator_categories, [
      CreatorCategory.create!(
        :creator => nil,
        :category => nil
      ),
      CreatorCategory.create!(
        :creator => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of creator_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
