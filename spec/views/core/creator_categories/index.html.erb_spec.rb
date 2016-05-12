require 'rails_helper'

RSpec.describe "core/creator_categories/index", type: :view do
  before(:each) do
    assign(:core_creator_categories, [
      Core::CreatorCategory.create!(
        :creator => nil,
        :category => nil
      ),
      Core::CreatorCategory.create!(
        :creator => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of core/creator_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
