require 'rails_helper'

RSpec.describe "creator_tags/index", type: :view do
  before(:each) do
    assign(:creator_tags, [
      CreatorTag.create!(
        :creator => nil,
        :tag => nil
      ),
      CreatorTag.create!(
        :creator => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of creator_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
