require 'rails_helper'

RSpec.describe "manage/creator_categories/new", type: :view do
  before(:each) do
    assign(:manage_creator_category, Manage::CreatorCategory.new(
      :creator => nil,
      :category => nil
    ))
  end

  it "renders new manage_creator_category form" do
    render

    assert_select "form[action=?][method=?]", manage_creator_categories_path, "post" do

      assert_select "input#manage_creator_category_creator_id[name=?]", "manage_creator_category[creator_id]"

      assert_select "input#manage_creator_category_category_id[name=?]", "manage_creator_category[category_id]"
    end
  end
end
