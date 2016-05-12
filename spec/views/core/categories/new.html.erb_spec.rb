require 'rails_helper'

RSpec.describe "core/categories/new", type: :view do
  before(:each) do
    assign(:core_category, Core::Category.new(
      :name => "MyString",
      :parent => nil
    ))
  end

  it "renders new core_category form" do
    render

    assert_select "form[action=?][method=?]", core_categories_path, "post" do

      assert_select "input#core_category_name[name=?]", "core_category[name]"

      assert_select "input#core_category_parent_id[name=?]", "core_category[parent_id]"
    end
  end
end
