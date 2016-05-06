require 'rails_helper'

RSpec.describe "manage/creators/index", type: :view do
  before(:each) do
    assign(:manage_creators, [
      Manage::Creator.create!(
        :sid => "Sid",
        :user => nil,
        :name => "Name",
        :text => ""
      ),
      Manage::Creator.create!(
        :sid => "Sid",
        :user => nil,
        :name => "Name",
        :text => ""
      )
    ])
  end

  it "renders a list of manage/creators" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
