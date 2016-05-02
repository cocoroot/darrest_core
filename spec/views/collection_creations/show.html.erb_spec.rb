require 'rails_helper'

RSpec.describe "collection_creations/show", type: :view do
  before(:each) do
    @collection_creation = assign(:collection_creation, CollectionCreation.create!(
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
