require 'rails_helper'

RSpec.describe "site_users/new", type: :view do
  before(:each) do
    assign(:site_user, SiteUser.new(
      :sid => "MyString",
      :site => nil,
      :biography => "MyString",
      :tos_accepted => false,
      :site_user_status => nil
    ))
  end

  it "renders new site_user form" do
    render

    assert_select "form[action=?][method=?]", site_users_path, "post" do

      assert_select "input#site_user_sid[name=?]", "site_user[sid]"

      assert_select "input#site_user_site_id[name=?]", "site_user[site_id]"

      assert_select "input#site_user_biography[name=?]", "site_user[biography]"

      assert_select "input#site_user_tos_accepted[name=?]", "site_user[tos_accepted]"

      assert_select "input#site_user_site_user_status_id[name=?]", "site_user[site_user_status_id]"
    end
  end
end
