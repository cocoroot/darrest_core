require 'rails_helper'

RSpec.describe "site_user_tags/index", type: :view do
  before(:each) do
    assign(:site_user_tags, [
      SiteUserTag.create!(
        :site_user => nil,
        :tag => nil
      ),
      SiteUserTag.create!(
        :site_user => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of site_user_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
