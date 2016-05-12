require 'rails_helper'

RSpec.describe "core/creations/show", type: :view do
  before(:each) do
    @core_creation = assign(:core_creation, Core::Creation.create!(
      :sid => "Sid",
      :creator => nil,
      :title => "Title",
      :description => "MyText",
      :license_code => "License Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/License Code/)
  end
end
