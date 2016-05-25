require 'rails_helper'

RSpec.describe "creations/new", type: :view do
  before(:each) do
    assign(:creation, Creation.new(
      :sid => "MyString",
      :site => nil,
      :site_user => nil,
      :title => "MyString",
      :description => "MyString",
      :license_code => "MyString",
      :creation_status => nil
    ))
  end

  it "renders new creation form" do
    render

    assert_select "form[action=?][method=?]", creations_path, "post" do

      assert_select "input#creation_sid[name=?]", "creation[sid]"

      assert_select "input#creation_site_id[name=?]", "creation[site_id]"

      assert_select "input#creation_site_user_id[name=?]", "creation[site_user_id]"

      assert_select "input#creation_title[name=?]", "creation[title]"

      assert_select "input#creation_description[name=?]", "creation[description]"

      assert_select "input#creation_license_code[name=?]", "creation[license_code]"

      assert_select "input#creation_creation_status_id[name=?]", "creation[creation_status_id]"
    end
  end
end
