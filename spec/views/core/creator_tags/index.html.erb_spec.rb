require 'rails_helper'

RSpec.describe "core/creator_tags/index", type: :view do
  before(:each) do
    assign(:core_creator_tags, [
      Core::CreatorTag.create!(
        :creator => nil,
        :tag => nil
      ),
      Core::CreatorTag.create!(
        :creator => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of core/creator_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
