require 'rails_helper'

RSpec.describe "core/collection_creations/edit", type: :view do
  before(:each) do
    @core_collection_creation = assign(:core_collection_creation, Core::CollectionCreation.create!(
      :collection => nil,
      :creation => nil
    ))
  end

  it "renders the edit core_collection_creation form" do
    render

    assert_select "form[action=?][method=?]", core_collection_creation_path(@core_collection_creation), "post" do

      assert_select "input#core_collection_creation_collection_id[name=?]", "core_collection_creation[collection_id]"

      assert_select "input#core_collection_creation_creation_id[name=?]", "core_collection_creation[creation_id]"
    end
  end
end
