require 'rails_helper'

RSpec.describe "core/categories/show", type: :view do
  before(:each) do
    @core_category = assign(:core_category, Core::Category.create!(
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
