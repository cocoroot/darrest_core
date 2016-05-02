require 'rails_helper'

RSpec.describe "creator_categories/edit", type: :view do
  before(:each) do
    @creator_category = assign(:creator_category, CreatorCategory.create!(
      :creator => nil,
      :category => nil
    ))
  end

  it "renders the edit creator_category form" do
    render

    assert_select "form[action=?][method=?]", creator_category_path(@creator_category), "post" do

      assert_select "input#creator_category_creator_id[name=?]", "creator_category[creator_id]"

      assert_select "input#creator_category_category_id[name=?]", "creator_category[category_id]"
    end
  end
end
