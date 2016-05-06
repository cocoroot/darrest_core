require 'rails_helper'

RSpec.describe "core/creation_categories/new", type: :view do
  before(:each) do
    assign(:core_creation_category, Core::CreationCategory.new(
      :creation => nil,
      :category => nil
    ))
  end

  it "renders new core_creation_category form" do
    render

    assert_select "form[action=?][method=?]", core_creation_categories_path, "post" do

      assert_select "input#core_creation_category_creation_id[name=?]", "core_creation_category[creation_id]"

      assert_select "input#core_creation_category_category_id[name=?]", "core_creation_category[category_id]"
    end
  end
end
