require 'rails_helper'

RSpec.describe "core/creation_categories/edit", type: :view do
  before(:each) do
    @core_creation_category = assign(:core_creation_category, Core::CreationCategory.create!(
      :creation => nil,
      :category => nil
    ))
  end

  it "renders the edit core_creation_category form" do
    render

    assert_select "form[action=?][method=?]", core_creation_category_path(@core_creation_category), "post" do

      assert_select "input#core_creation_category_creation_id[name=?]", "core_creation_category[creation_id]"

      assert_select "input#core_creation_category_category_id[name=?]", "core_creation_category[category_id]"
    end
  end
end