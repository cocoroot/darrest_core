require 'rails_helper'

RSpec.describe "core/creation_comments/edit", type: :view do
  before(:each) do
    @core_creation_comment = assign(:core_creation_comment, Core::CreationComment.create!(
      :sid => "MyString",
      :creation => nil,
      :user => nil,
      :parent => nil,
      :notice_code => "MyString"
    ))
  end

  it "renders the edit core_creation_comment form" do
    render

    assert_select "form[action=?][method=?]", core_creation_comment_path(@core_creation_comment), "post" do

      assert_select "input#core_creation_comment_sid[name=?]", "core_creation_comment[sid]"

      assert_select "input#core_creation_comment_creation_id[name=?]", "core_creation_comment[creation_id]"

      assert_select "input#core_creation_comment_user_id[name=?]", "core_creation_comment[user_id]"

      assert_select "input#core_creation_comment_parent_id[name=?]", "core_creation_comment[parent_id]"

      assert_select "input#core_creation_comment_notice_code[name=?]", "core_creation_comment[notice_code]"
    end
  end
end
