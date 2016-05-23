require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :sid => "MyString",
      :creation => nil,
      :site_user => nil,
      :body => "MyString",
      :parent => 1,
      :notice_code => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_sid[name=?]", "comment[sid]"

      assert_select "input#comment_creation_id[name=?]", "comment[creation_id]"

      assert_select "input#comment_site_user_id[name=?]", "comment[site_user_id]"

      assert_select "input#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_parent[name=?]", "comment[parent]"

      assert_select "input#comment_notice_code[name=?]", "comment[notice_code]"
    end
  end
end
