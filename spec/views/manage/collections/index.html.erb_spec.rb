require 'rails_helper'

RSpec.describe "manage/collections/index", type: :view do
  before(:each) do
    assign(:manage_collections, [
      Manage::Collection.create!(
        :sid => "MyText",
        :user => nil,
        :title => "MyText"
      ),
      Manage::Collection.create!(
        :sid => "MyText",
        :user => nil,
        :title => "MyText"
      )
    ])
  end

  it "renders a list of manage/collections" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
