require 'rails_helper'

RSpec.describe "manage/creator_tags/show", type: :view do
  before(:each) do
    @manage_creator_tag = assign(:manage_creator_tag, Manage::CreatorTag.create!(
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
