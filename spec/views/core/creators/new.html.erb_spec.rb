require 'rails_helper'

RSpec.describe "core/creators/new", type: :view do
  before(:each) do
    assign(:core_creator, Core::Creator.new(
      :sid => "MyString",
      :user => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new core_creator form" do
    render

    assert_select "form[action=?][method=?]", core_creators_path, "post" do

      assert_select "input#core_creator_sid[name=?]", "core_creator[sid]"

      assert_select "input#core_creator_user_id[name=?]", "core_creator[user_id]"

      assert_select "input#core_creator_name[name=?]", "core_creator[name]"

      assert_select "textarea#core_creator_description[name=?]", "core_creator[description]"
    end
  end
end
