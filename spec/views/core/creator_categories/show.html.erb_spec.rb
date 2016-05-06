require 'rails_helper'

RSpec.describe "core/creator_categories/show", type: :view do
  before(:each) do
    @core_creator_category = assign(:core_creator_category, Core::CreatorCategory.create!(
      :creator => nil,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
