require 'rails_helper'

RSpec.describe "site_users/index", type: :view do
  before(:each) do
    assign(:site_users, [
      SiteUser.create!(
        :sid => "Sid",
        :site => nil,
        :biography => "Biography",
        :tos_accepted => false,
        :site_user_status => nil
      ),
      SiteUser.create!(
        :sid => "Sid",
        :site => nil,
        :biography => "Biography",
        :tos_accepted => false,
        :site_user_status => nil
      )
    ])
  end

  it "renders a list of site_users" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Biography".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
