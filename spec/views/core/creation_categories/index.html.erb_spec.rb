require 'rails_helper'

RSpec.describe "core/creation_categories/index", type: :view do
  before(:each) do
    assign(:core_creation_categories, [
      Core::CreationCategory.create!(
        :creation => nil,
        :category => nil
      ),
      Core::CreationCategory.create!(
        :creation => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of core/creation_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
