require 'rails_helper'

RSpec.describe "core/tags/index", type: :view do
  before(:each) do
    assign(:core_tags, [
      Core::Tag.create!(
        :name => "Name"
      ),
      Core::Tag.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of core/tags" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
