require 'rails_helper'

RSpec.describe "creation_categories/new", type: :view do
  before(:each) do
    assign(:creation_category, CreationCategory.new(
      :creation => nil,
      :category => nil
    ))
  end

  it "renders new creation_category form" do
    render

    assert_select "form[action=?][method=?]", creation_categories_path, "post" do

      assert_select "input#creation_category_creation_id[name=?]", "creation_category[creation_id]"

      assert_select "input#creation_category_category_id[name=?]", "creation_category[category_id]"
    end
  end
end
