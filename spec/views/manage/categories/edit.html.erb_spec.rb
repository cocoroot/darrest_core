require 'rails_helper'

RSpec.describe "manage/categories/edit", type: :view do
  before(:each) do
    @manage_category = assign(:manage_category, Manage::Category.create!(
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit manage_category form" do
    render

    assert_select "form[action=?][method=?]", manage_category_path(@manage_category), "post" do

      assert_select "input#manage_category_name[name=?]", "manage_category[name]"

      assert_select "input#manage_category_parent_id[name=?]", "manage_category[parent_id]"
    end
  end
end
