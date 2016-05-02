require 'rails_helper'

RSpec.describe "creator_categories/new", type: :view do
  before(:each) do
    assign(:creator_category, CreatorCategory.new(
      :creator => nil,
      :category => nil
    ))
  end

  it "renders new creator_category form" do
    render

    assert_select "form[action=?][method=?]", creator_categories_path, "post" do

      assert_select "input#creator_category_creator_id[name=?]", "creator_category[creator_id]"

      assert_select "input#creator_category_category_id[name=?]", "creator_category[category_id]"
    end
  end
end
