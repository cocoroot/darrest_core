require 'rails_helper'

RSpec.describe "core/categories/edit", type: :view do
  before(:each) do
    @core_category = assign(:core_category, Core::Category.create!(
      :name => "MyString",
      :parent => nil
    ))
  end

  it "renders the edit core_category form" do
    render

    assert_select "form[action=?][method=?]", core_category_path(@core_category), "post" do

      assert_select "input#core_category_name[name=?]", "core_category[name]"

      assert_select "input#core_category_parent_id[name=?]", "core_category[parent_id]"
    end
  end
end
