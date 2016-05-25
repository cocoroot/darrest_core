require 'rails_helper'

RSpec.describe "creations/index", type: :view do
  before(:each) do
    assign(:creations, [
      Creation.create!(
        :sid => "Sid",
        :site => nil,
        :site_user => nil,
        :title => "Title",
        :description => "Description",
        :license_code => "License Code",
        :creation_status => nil
      ),
      Creation.create!(
        :sid => "Sid",
        :site => nil,
        :site_user => nil,
        :title => "Title",
        :description => "Description",
        :license_code => "License Code",
        :creation_status => nil
      )
    ])
  end

  it "renders a list of creations" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "License Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
