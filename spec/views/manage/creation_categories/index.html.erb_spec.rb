require 'rails_helper'

RSpec.describe "manage/creation_categories/index", type: :view do
  before(:each) do
    assign(:manage_creation_categories, [
      Manage::CreationCategory.create!(
        :creation => nil,
        :category => nil
      ),
      Manage::CreationCategory.create!(
        :creation => nil,
        :category => nil
      )
    ])
  end

  it "renders a list of manage/creation_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
