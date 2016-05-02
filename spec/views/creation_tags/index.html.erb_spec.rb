require 'rails_helper'

RSpec.describe "creation_tags/index", type: :view do
  before(:each) do
    assign(:creation_tags, [
      CreationTag.create!(
        :creation => nil,
        :tag => nil
      ),
      CreationTag.create!(
        :creation => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of creation_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
