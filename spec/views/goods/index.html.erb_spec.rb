require 'rails_helper'

RSpec.describe "goods/index", type: :view do
  before(:each) do
    assign(:goods, [
      Good.create!(
        :creation => nil,
        :user => nil
      ),
      Good.create!(
        :creation => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of goods" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
