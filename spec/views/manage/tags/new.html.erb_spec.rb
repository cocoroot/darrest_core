require 'rails_helper'

RSpec.describe "manage/tags/new", type: :view do
  before(:each) do
    assign(:manage_tag, Manage::Tag.new(
      :name => "MyString"
    ))
  end

  it "renders new manage_tag form" do
    render

    assert_select "form[action=?][method=?]", manage_tags_path, "post" do

      assert_select "input#manage_tag_name[name=?]", "manage_tag[name]"
    end
  end
end
