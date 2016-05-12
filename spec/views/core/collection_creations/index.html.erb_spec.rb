require 'rails_helper'

RSpec.describe "core/collection_creations/index", type: :view do
  before(:each) do
    assign(:core_collection_creations, [
      Core::CollectionCreation.create!(
        :collection => nil,
        :creation => nil
      ),
      Core::CollectionCreation.create!(
        :collection => nil,
        :creation => nil
      )
    ])
  end

  it "renders a list of core/collection_creations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
