require 'rails_helper'

RSpec.describe "core/goods/show", type: :view do
  before(:each) do
    @core_good = assign(:core_good, Core::Good.create!(
      :creation => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
