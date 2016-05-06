require 'rails_helper'

RSpec.describe "manage/collection_creations/new", type: :view do
  before(:each) do
    assign(:manage_collection_creation, Manage::CollectionCreation.new(
      :collection => nil,
      :creation => nil
    ))
  end

  it "renders new manage_collection_creation form" do
    render

    assert_select "form[action=?][method=?]", manage_collection_creations_path, "post" do

      assert_select "input#manage_collection_creation_collection_id[name=?]", "manage_collection_creation[collection_id]"

      assert_select "input#manage_collection_creation_creation_id[name=?]", "manage_collection_creation[creation_id]"
    end
  end
end
