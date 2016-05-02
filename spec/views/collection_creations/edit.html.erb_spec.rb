require 'rails_helper'

RSpec.describe "collection_creations/edit", type: :view do
  before(:each) do
    @collection_creation = assign(:collection_creation, CollectionCreation.create!(
      :collection => nil,
      :creation => nil
    ))
  end

  it "renders the edit collection_creation form" do
    render

    assert_select "form[action=?][method=?]", collection_creation_path(@collection_creation), "post" do

      assert_select "input#collection_creation_collection_id[name=?]", "collection_creation[collection_id]"

      assert_select "input#collection_creation_creation_id[name=?]", "collection_creation[creation_id]"
    end
  end
end
