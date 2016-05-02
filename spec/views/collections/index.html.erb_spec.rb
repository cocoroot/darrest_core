require 'rails_helper'

RSpec.describe "collections/index", type: :view do
  before(:each) do
    assign(:collections, [
      Collection.create!(
        :sid => "MyText",
        :user => nil,
        :title => "MyText"
      ),
      Collection.create!(
        :sid => "MyText",
        :user => nil,
        :title => "MyText"
      )
    ])
  end

  it "renders a list of collections" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
