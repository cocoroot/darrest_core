require 'rails_helper'

RSpec.describe "tags/edit", type: :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :name => "MyString",
      :tag_class => nil,
      :site => nil
    ))
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(@tag), "post" do

      assert_select "input#tag_name[name=?]", "tag[name]"

      assert_select "input#tag_tag_class_id[name=?]", "tag[tag_class_id]"

      assert_select "input#tag_site_id[name=?]", "tag[site_id]"
    end
  end
end
