require 'rails_helper'

RSpec.describe "core/creator_tags/show", type: :view do
  before(:each) do
    @core_creator_tag = assign(:core_creator_tag, Core::CreatorTag.create!(
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
