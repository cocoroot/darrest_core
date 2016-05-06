require 'rails_helper'

RSpec.describe "manage/creators/new", type: :view do
  before(:each) do
    assign(:manage_creator, Manage::Creator.new(
      :sid => "MyString",
      :user => nil,
      :name => "MyString",
      :text => ""
    ))
  end

  it "renders new manage_creator form" do
    render

    assert_select "form[action=?][method=?]", manage_creators_path, "post" do

      assert_select "input#manage_creator_sid[name=?]", "manage_creator[sid]"

      assert_select "input#manage_creator_user_id[name=?]", "manage_creator[user_id]"

      assert_select "input#manage_creator_name[name=?]", "manage_creator[name]"

      assert_select "input#manage_creator_text[name=?]", "manage_creator[text]"
    end
  end
end
