require 'rails_helper'

RSpec.describe "core/goods/index", type: :view do
  before(:each) do
    assign(:core_goods, [
      Core::Good.create!(
        :creation => nil,
        :user => nil
      ),
      Core::Good.create!(
        :creation => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of core/goods" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
