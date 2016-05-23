require 'rails_helper'

RSpec.describe "collections/show", type: :view do
  before(:each) do
    @collection = assign(:collection, Collection.create!(
      :sid => "Sid",
      :site_user => nil,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
  end
end
