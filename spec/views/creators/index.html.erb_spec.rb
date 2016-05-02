require 'rails_helper'

RSpec.describe "creators/index", type: :view do
  before(:each) do
    assign(:creators, [
      Creator.create!(
        :sid => "Sid",
        :user => nil,
        :name => "Name",
        :description => "MyText"
      ),
      Creator.create!(
        :sid => "Sid",
        :user => nil,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of creators" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
