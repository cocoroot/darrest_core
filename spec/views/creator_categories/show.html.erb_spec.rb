require 'rails_helper'

RSpec.describe "creator_categories/show", type: :view do
  before(:each) do
    @creator_category = assign(:creator_category, CreatorCategory.create!(
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
