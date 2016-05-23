require 'rails_helper'

RSpec.describe "site_user_statuses/index", type: :view do
  before(:each) do
    assign(:site_user_statuses, [
      SiteUserStatus.create!(
        :name => "Name"
      ),
      SiteUserStatus.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of site_user_statuses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
