require 'rails_helper'

RSpec.describe "core/tags/new", type: :view do
  before(:each) do
    assign(:core_tag, Core::Tag.new(
      :name => "MyString"
    ))
  end

  it "renders new core_tag form" do
    render

    assert_select "form[action=?][method=?]", core_tags_path, "post" do

      assert_select "input#core_tag_name[name=?]", "core_tag[name]"
    end
  end
end
