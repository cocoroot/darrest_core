require 'rails_helper'

RSpec.describe "core/creators/index", type: :view do
  before(:each) do
    assign(:core_creators, [
      Core::Creator.create!(
        :sid => "Sid",
        :user => nil,
        :name => "Name",
        :description => "MyText"
      ),
      Core::Creator.create!(
        :sid => "Sid",
        :user => nil,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of core/creators" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
