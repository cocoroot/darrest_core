require 'rails_helper'

RSpec.describe "manage/categories/index", type: :view do
  before(:each) do
    assign(:manage_categories, [
      Manage::Category.create!(
        :name => "Name",
        :parent_id => 1
      ),
      Manage::Category.create!(
        :name => "Name",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of manage/categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
