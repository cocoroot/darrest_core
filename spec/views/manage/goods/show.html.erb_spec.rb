require 'rails_helper'

RSpec.describe "manage/goods/show", type: :view do
  before(:each) do
    @manage_good = assign(:manage_good, Manage::Good.create!(
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
