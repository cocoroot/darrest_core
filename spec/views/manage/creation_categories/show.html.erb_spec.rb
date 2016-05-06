require 'rails_helper'

RSpec.describe "manage/creation_categories/show", type: :view do
  before(:each) do
    @manage_creation_category = assign(:manage_creation_category, Manage::CreationCategory.create!(
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
