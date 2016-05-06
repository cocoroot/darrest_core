require 'rails_helper'

RSpec.describe "manage/creation_comments/edit", type: :view do
  before(:each) do
    @manage_creation_comment = assign(:manage_creation_comment, Manage::CreationComment.create!(
      :sid => "MyString",
      :creation => nil,
      :user => nil,
      :parent => nil,
      :notice_code => "MyString"
    ))
  end

  it "renders the edit manage_creation_comment form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_comment_path(@manage_creation_comment), "post" do

      assert_select "input#manage_creation_comment_sid[name=?]", "manage_creation_comment[sid]"

      assert_select "input#manage_creation_comment_creation_id[name=?]", "manage_creation_comment[creation_id]"

      assert_select "input#manage_creation_comment_user_id[name=?]", "manage_creation_comment[user_id]"

      assert_select "input#manage_creation_comment_parent_id[name=?]", "manage_creation_comment[parent_id]"

      assert_select "input#manage_creation_comment_notice_code[name=?]", "manage_creation_comment[notice_code]"
    end
  end
end
