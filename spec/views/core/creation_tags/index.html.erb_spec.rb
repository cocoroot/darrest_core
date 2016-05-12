require 'rails_helper'

RSpec.describe "core/creation_tags/index", type: :view do
  before(:each) do
    assign(:core_creation_tags, [
      Core::CreationTag.create!(
        :creation => nil,
        :tag => nil
      ),
      Core::CreationTag.create!(
        :creation => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of core/creation_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
