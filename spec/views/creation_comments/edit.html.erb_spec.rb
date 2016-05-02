require 'rails_helper'

RSpec.describe "creation_comments/edit", type: :view do
  before(:each) do
    @creation_comment = assign(:creation_comment, CreationComment.create!(
      :sid => "MyString",
      :creation => nil,
      :user => nil,
      :parent => nil,
      :notice_code => "MyString"
    ))
  end

  it "renders the edit creation_comment form" do
    render

    assert_select "form[action=?][method=?]", creation_comment_path(@creation_comment), "post" do

      assert_select "input#creation_comment_sid[name=?]", "creation_comment[sid]"

      assert_select "input#creation_comment_creation_id[name=?]", "creation_comment[creation_id]"

      assert_select "input#creation_comment_user_id[name=?]", "creation_comment[user_id]"

      assert_select "input#creation_comment_parent_id[name=?]", "creation_comment[parent_id]"

      assert_select "input#creation_comment_notice_code[name=?]", "creation_comment[notice_code]"
    end
  end
end
