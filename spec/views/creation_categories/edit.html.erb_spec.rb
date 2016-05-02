require 'rails_helper'

RSpec.describe "creation_categories/edit", type: :view do
  before(:each) do
    @creation_category = assign(:creation_category, CreationCategory.create!(
      :creation => nil,
      :category => nil
    ))
  end

  it "renders the edit creation_category form" do
    render

    assert_select "form[action=?][method=?]", creation_category_path(@creation_category), "post" do

      assert_select "input#creation_category_creation_id[name=?]", "creation_category[creation_id]"

      assert_select "input#creation_category_category_id[name=?]", "creation_category[category_id]"
    end
  end
end
