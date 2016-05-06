require 'rails_helper'

RSpec.describe "manage/creation_tags/show", type: :view do
  before(:each) do
    @manage_creation_tag = assign(:manage_creation_tag, Manage::CreationTag.create!(
      :creation => nil,
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
