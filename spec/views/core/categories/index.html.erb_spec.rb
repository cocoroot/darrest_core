require 'rails_helper'

RSpec.describe "core/categories/index", type: :view do
  before(:each) do
    assign(:core_categories, [
      Core::Category.create!(
        :name => "Name",
        :parent => nil
      ),
      Core::Category.create!(
        :name => "Name",
        :parent => nil
      )
    ])
  end

  it "renders a list of core/categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
