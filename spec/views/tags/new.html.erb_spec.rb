require 'rails_helper'

RSpec.describe "tags/new", type: :view do
  before(:each) do
    assign(:tag, Tag.new(
      :name => "MyString",
      :tag_class => nil,
      :site => nil
    ))
  end

  it "renders new tag form" do
    render

    assert_select "form[action=?][method=?]", tags_path, "post" do

      assert_select "input#tag_name[name=?]", "tag[name]"

      assert_select "input#tag_tag_class_id[name=?]", "tag[tag_class_id]"

      assert_select "input#tag_site_id[name=?]", "tag[site_id]"
    end
  end
end
