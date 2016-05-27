require 'rails_helper'

RSpec.describe "sites/index", type: :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        :name => "Name",
        :url => "Url",
        :access_key => "Access Key"
      ),
      Site.create!(
        :name => "Name",
        :url => "Url",
        :access_key => "Access Key"
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Access Key".to_s, :count => 2
  end
end
