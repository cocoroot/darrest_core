require 'rails_helper'

RSpec.describe "manage/creators/edit", type: :view do
  before(:each) do
    @manage_creator = assign(:manage_creator, Manage::Creator.create!(
      :sid => "MyString",
      :user => nil,
      :name => "MyString",
      :text => ""
    ))
  end

  it "renders the edit manage_creator form" do
    render

    assert_select "form[action=?][method=?]", manage_creator_path(@manage_creator), "post" do

      assert_select "input#manage_creator_sid[name=?]", "manage_creator[sid]"

      assert_select "input#manage_creator_user_id[name=?]", "manage_creator[user_id]"

      assert_select "input#manage_creator_name[name=?]", "manage_creator[name]"

      assert_select "input#manage_creator_text[name=?]", "manage_creator[text]"
    end
  end
end
