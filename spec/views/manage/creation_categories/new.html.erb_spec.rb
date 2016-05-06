require 'rails_helper'

RSpec.describe "manage/creation_categories/new", type: :view do
  before(:each) do
    assign(:manage_creation_category, Manage::CreationCategory.new(
      :creation => nil,
      :category => nil
    ))
  end

  it "renders new manage_creation_category form" do
    render

    assert_select "form[action=?][method=?]", manage_creation_categories_path, "post" do

      assert_select "input#manage_creation_category_creation_id[name=?]", "manage_creation_category[creation_id]"

      assert_select "input#manage_creation_category_category_id[name=?]", "manage_creation_category[category_id]"
    end
  end
end
