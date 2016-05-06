require 'rails_helper'

RSpec.describe "manage/collection_creations/edit", type: :view do
  before(:each) do
    @manage_collection_creation = assign(:manage_collection_creation, Manage::CollectionCreation.create!(
      :collection => nil,
      :creation => nil
    ))
  end

  it "renders the edit manage_collection_creation form" do
    render

    assert_select "form[action=?][method=?]", manage_collection_creation_path(@manage_collection_creation), "post" do

      assert_select "input#manage_collection_creation_collection_id[name=?]", "manage_collection_creation[collection_id]"

      assert_select "input#manage_collection_creation_creation_id[name=?]", "manage_collection_creation[creation_id]"
    end
  end
end
