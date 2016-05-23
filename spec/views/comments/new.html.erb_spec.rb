require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :sid => "MyString",
      :creation => nil,
      :site_user => nil,
      :body => "MyString",
      :parent => 1,
      :notice_code => "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_sid[name=?]", "comment[sid]"

      assert_select "input#comment_creation_id[name=?]", "comment[creation_id]"

      assert_select "input#comment_site_user_id[name=?]", "comment[site_user_id]"

      assert_select "input#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_parent[name=?]", "comment[parent]"

      assert_select "input#comment_notice_code[name=?]", "comment[notice_code]"
    end
  end
end
