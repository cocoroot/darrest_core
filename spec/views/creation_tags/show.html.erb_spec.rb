require 'rails_helper'

RSpec.describe "creation_tags/show", type: :view do
  before(:each) do
    @creation_tag = assign(:creation_tag, CreationTag.create!(
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
