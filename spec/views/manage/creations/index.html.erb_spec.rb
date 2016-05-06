require 'rails_helper'

RSpec.describe "manage/creations/index", type: :view do
  before(:each) do
    assign(:manage_creations, [
      Manage::Creation.create!(
        :sid => "Sid",
        :creator => nil,
        :title => "Title",
        :description => "MyText",
        :license_code => "License Code"
      ),
      Manage::Creation.create!(
        :sid => "Sid",
        :creator => nil,
        :title => "Title",
        :description => "MyText",
        :license_code => "License Code"
      )
    ])
  end

  it "renders a list of manage/creations" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "License Code".to_s, :count => 2
  end
end
