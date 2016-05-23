require 'rails_helper'

RSpec.describe "site_user_statuses/new", type: :view do
  before(:each) do
    assign(:site_user_status, SiteUserStatus.new(
      :name => "MyString"
    ))
  end

  it "renders new site_user_status form" do
    render

    assert_select "form[action=?][method=?]", site_user_statuses_path, "post" do

      assert_select "input#site_user_status_name[name=?]", "site_user_status[name]"
    end
  end
end
