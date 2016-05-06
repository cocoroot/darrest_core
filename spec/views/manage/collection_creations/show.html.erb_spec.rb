require 'rails_helper'

RSpec.describe "manage/collection_creations/show", type: :view do
  before(:each) do
    @manage_collection_creation = assign(:manage_collection_creation, Manage::CollectionCreation.create!(
      :collection => nil,
      :creation => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
