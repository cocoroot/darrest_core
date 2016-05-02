require 'rails_helper'

RSpec.describe "collections/show", type: :view do
  before(:each) do
    @collection = assign(:collection, Collection.create!(
      :sid => "MyText",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
