require 'rails_helper'

RSpec.describe "site_user_statuses/edit", type: :view do
  before(:each) do
    @site_user_status = assign(:site_user_status, SiteUserStatus.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit site_user_status form" do
    render

    assert_select "form[action=?][method=?]", site_user_status_path(@site_user_status), "post" do

      assert_select "input#site_user_status_name[name=?]", "site_user_status[name]"
    end
  end
end
