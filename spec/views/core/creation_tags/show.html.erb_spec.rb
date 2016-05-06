require 'rails_helper'

RSpec.describe "core/creation_tags/show", type: :view do
  before(:each) do
    @core_creation_tag = assign(:core_creation_tag, Core::CreationTag.create!(
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
