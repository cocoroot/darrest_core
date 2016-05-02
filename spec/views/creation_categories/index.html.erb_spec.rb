require 'rails_helper'

RSpec.describe "creation_categories/index", type: :view do
  before(:each) do
    assign(:creation_categories, [
      CreationCategory.create!(
        :creation => nil,
        :category => nil
      ),
      CreationCategory.create!(
        :creation => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of creation_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
