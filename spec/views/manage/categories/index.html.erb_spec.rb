require 'rails_helper'

RSpec.describe "manage/categories/index", type: :view do
  before(:each) do
    assign(:manage_categories, [
      Manage::Category.create!(
        :name => "Name",
        :parent => nil
      ),
      Manage::Category.create!(
        :name => "Name",
        :parent => nil
      )
    ])
  end

  it "renders a list of manage/categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
