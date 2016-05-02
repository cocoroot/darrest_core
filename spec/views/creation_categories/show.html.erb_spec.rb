require 'rails_helper'

RSpec.describe "creation_categories/show", type: :view do
  before(:each) do
    @creation_category = assign(:creation_category, CreationCategory.create!(
      :creation => nil,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
