require 'rails_helper'

RSpec.describe "creations/new", type: :view do
  before(:each) do
    assign(:creation, Creation.new(
      :sid => "MyString",
      :creator => nil,
      :title => "MyString",
      :description => "MyText",
      :license_code => "MyString"
    ))
  end

  it "renders new creation form" do
    render

    assert_select "form[action=?][method=?]", creations_path, "post" do

      assert_select "input#creation_sid[name=?]", "creation[sid]"

      assert_select "input#creation_creator_id[name=?]", "creation[creator_id]"

      assert_select "input#creation_title[name=?]", "creation[title]"

      assert_select "textarea#creation_description[name=?]", "creation[description]"

      assert_select "input#creation_license_code[name=?]", "creation[license_code]"
    end
  end
end
