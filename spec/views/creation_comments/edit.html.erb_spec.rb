require 'rails_helper'

RSpec.describe "creation_comments/edit", type: :view do
  before(:each) do
    @creation_comment = assign(:creation_comment, CreationComment.create!(
      :sid => "MyString",
      :creation => nil,
      :site_user => nil,
      :body => "MyString",
      :parent => 1,
      :notice_code => "MyString"
    ))
  end

  it "renders the edit creation_comment form" do
    render

    assert_select "form[action=?][method=?]", creation_comment_path(@creation_comment), "post" do

      assert_select "input#creation_comment_sid[name=?]", "creation_comment[sid]"

      assert_select "input#creation_comment_creation_id[name=?]", "creation_comment[creation_id]"

      assert_select "input#creation_comment_site_user_id[name=?]", "creation_comment[site_user_id]"

      assert_select "input#creation_comment_body[name=?]", "creation_comment[body]"

      assert_select "input#creation_comment_parent[name=?]", "creation_comment[parent]"

      assert_select "input#creation_comment_notice_code[name=?]", "creation_comment[notice_code]"
    end
  end
end
