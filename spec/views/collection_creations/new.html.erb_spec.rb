require 'rails_helper'

RSpec.describe "collection_creations/new", type: :view do
  before(:each) do
    assign(:collection_creation, CollectionCreation.new(
      :collection => nil,
      :creation => nil
    ))
  end

  it "renders new collection_creation form" do
    render

    assert_select "form[action=?][method=?]", collection_creations_path, "post" do

      assert_select "input#collection_creation_collection_id[name=?]", "collection_creation[collection_id]"

      assert_select "input#collection_creation_creation_id[name=?]", "collection_creation[creation_id]"
    end
  end
end
