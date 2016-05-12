require 'rails_helper'

RSpec.describe "core/collections/show", type: :view do
  before(:each) do
    @core_collection = assign(:core_collection, Core::Collection.create!(
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
