require 'rails_helper'

RSpec.describe "creator_tags/show", type: :view do
  before(:each) do
    @creator_tag = assign(:creator_tag, CreatorTag.create!(
      :creator => nil,
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
