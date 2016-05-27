require 'rails_helper'

RSpec.describe "sites/new", type: :view do
  before(:each) do
    assign(:site, Site.new(
      :name => "MyString",
      :url => "MyString",
      :access_key => "MyString"
    ))
  end

  it "renders new site form" do
    render

    assert_select "form[action=?][method=?]", sites_path, "post" do

      assert_select "input#site_name[name=?]", "site[name]"

      assert_select "input#site_url[name=?]", "site[url]"

      assert_select "input#site_access_key[name=?]", "site[access_key]"
    end
  end
end
