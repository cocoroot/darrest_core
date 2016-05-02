require 'rails_helper'

RSpec.describe "collection_creations/index", type: :view do
  before(:each) do
    assign(:collection_creations, [
      CollectionCreation.create!(
        :collection => nil,
        :creation => nil
      ),
      CollectionCreation.create!(
        :collection => nil,
        :creation => nil
      )
    ])
  end

  it "renders a list of collection_creations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
