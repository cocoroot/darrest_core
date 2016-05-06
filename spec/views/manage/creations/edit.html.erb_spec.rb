require 'rails_helper'

RSpec.describe "manage/creations/edit", type: :view do
  before(:each) do
    @manage_creation = assign(:manage_creation, Manage::Creation.create!(
      :sid => "MyString",
      :creator => nil,
      :title => "MyString",
      :description => "MyText",
      :license_code => "MyString"
    ))
  end

  it "renders the edit manage_creation form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_path(@manage_creation), "post" do

      assert_select "input#manage_creation_sid[name=?]", "manage_creation[sid]"

      assert_select "input#manage_creation_creator_id[name=?]", "manage_creation[creator_id]"

      assert_select "input#manage_creation_title[name=?]", "manage_creation[title]"

      assert_select "textarea#manage_creation_description[name=?]", "manage_creation[description]"

      assert_select "input#manage_creation_license_code[name=?]", "manage_creation[license_code]"
    end
  end
end
