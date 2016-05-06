require 'rails_helper'

RSpec.describe "manage/categories/new", type: :view do
  before(:each) do
    assign(:manage_category, Manage::Category.new(
      :name => "MyString",
      :parent => nil
    ))
  end

  it "renders new manage_category form" do
    render

    assert_select "form[action=?][method=?]", manage_categories_path, "post" do

      assert_select "input#manage_category_name[name=?]", "manage_category[name]"

      assert_select "input#manage_category_parent_id[name=?]", "manage_category[parent_id]"
    end
  end
end
