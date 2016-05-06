require 'rails_helper'

RSpec.describe "core/tags/show", type: :view do
  before(:each) do
    @core_tag = assign(:core_tag, Core::Tag.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
