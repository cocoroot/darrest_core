require 'rails_helper'

RSpec.describe "core/creator_categories/new", type: :view do
  before(:each) do
    assign(:core_creator_category, Core::CreatorCategory.new(
      :creator => nil,
      :category => nil
    ))
  end

  it "renders new core_creator_category form" do
    render

    assert_select "form[action=?][method=?]", core_creator_categories_path, "post" do

      assert_select "input#core_creator_category_creator_id[name=?]", "core_creator_category[creator_id]"

      assert_select "input#core_creator_category_category_id[name=?]", "core_creator_category[category_id]"
    end
  end
end
