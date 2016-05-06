require 'rails_helper'

RSpec.describe "manage/categories/show", type: :view do
  before(:each) do
    @manage_category = assign(:manage_category, Manage::Category.create!(
      :name => "Name",
      :parent => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
