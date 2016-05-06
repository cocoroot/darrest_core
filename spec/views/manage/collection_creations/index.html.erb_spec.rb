require 'rails_helper'

RSpec.describe "manage/collection_creations/index", type: :view do
  before(:each) do
    assign(:manage_collection_creations, [
      Manage::CollectionCreation.create!(
        :collection => nil,
        :creation => nil
      ),
      Manage::CollectionCreation.create!(
        :collection => nil,
        :creation => nil
      )
    ])
  end

  it "renders a list of manage/collection_creations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
