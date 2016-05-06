require 'rails_helper'

RSpec.describe "manage/goods/index", type: :view do
  before(:each) do
    assign(:manage_goods, [
      Manage::Good.create!(
        :creation => nil,
        :user => nil
      ),
      Manage::Good.create!(
        :creation => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of manage/goods" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
