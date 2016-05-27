require 'rails_helper'

RSpec.describe "sites/edit", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      :name => "MyString",
      :url => "MyString",
      :access_key => "MyString"
    ))
  end

  it "renders the edit site form" do
    render

    assert_select "form[action=?][method=?]", site_path(@site), "post" do

      assert_select "input#site_name[name=?]", "site[name]"

      assert_select "input#site_url[name=?]", "site[url]"

      assert_select "input#site_access_key[name=?]", "site[access_key]"
    end
  end
end
