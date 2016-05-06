require 'rails_helper'

RSpec.describe "core/creator_categories/edit", type: :view do
  before(:each) do
    @core_creator_category = assign(:core_creator_category, Core::CreatorCategory.create!(
      :creator => nil,
      :category => nil
    ))
  end

  it "renders the edit core_creator_category form" do
    render

    assert_select "form[action=?][method=?]", core_creator_category_path(@core_creator_category), "post" do

      assert_select "input#core_creator_category_creator_id[name=?]", "core_creator_category[creator_id]"

      assert_select "input#core_creator_category_category_id[name=?]", "core_creator_category[category_id]"
    end
  end
end
