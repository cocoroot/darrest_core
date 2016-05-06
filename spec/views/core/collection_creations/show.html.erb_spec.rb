require 'rails_helper'

RSpec.describe "core/collection_creations/show", type: :view do
  before(:each) do
    @core_collection_creation = assign(:core_collection_creation, Core::CollectionCreation.create!(
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
