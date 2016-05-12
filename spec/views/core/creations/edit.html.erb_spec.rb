require 'rails_helper'

RSpec.describe "core/creations/edit", type: :view do
  before(:each) do
    @core_creation = assign(:core_creation, Core::Creation.create!(
      :sid => "MyString",
      :creator => nil,
      :title => "MyString",
      :description => "MyText",
      :license_code => "MyString"
    ))
  end

  it "renders the edit core_creation form" do
    render

    assert_select "form[action=?][method=?]", core_creation_path(@core_creation), "post" do

      assert_select "input#core_creation_sid[name=?]", "core_creation[sid]"

      assert_select "input#core_creation_creator_id[name=?]", "core_creation[creator_id]"

      assert_select "input#core_creation_title[name=?]", "core_creation[title]"

      assert_select "textarea#core_creation_description[name=?]", "core_creation[description]"

      assert_select "input#core_creation_license_code[name=?]", "core_creation[license_code]"
    end
  end
end
