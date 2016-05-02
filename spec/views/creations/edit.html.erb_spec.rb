require 'rails_helper'

RSpec.describe "creations/edit", type: :view do
  before(:each) do
    @creation = assign(:creation, Creation.create!(
      :sid => "MyString",
      :creator => nil,
      :title => "MyString",
      :description => "MyText",
      :license_code => "MyString"
    ))
  end

  it "renders the edit creation form" do
    render

    assert_select "form[action=?][method=?]", creation_path(@creation), "post" do

      assert_select "input#creation_sid[name=?]", "creation[sid]"

      assert_select "input#creation_creator_id[name=?]", "creation[creator_id]"

      assert_select "input#creation_title[name=?]", "creation[title]"

      assert_select "textarea#creation_description[name=?]", "creation[description]"

      assert_select "input#creation_license_code[name=?]", "creation[license_code]"
    end
  end
end
