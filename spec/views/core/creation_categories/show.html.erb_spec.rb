require 'rails_helper'

RSpec.describe "core/creation_categories/show", type: :view do
  before(:each) do
    @core_creation_category = assign(:core_creation_category, Core::CreationCategory.create!(
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
