require 'rails_helper'

RSpec.describe "creations/show", type: :view do
  before(:each) do
    @creation = assign(:creation, Creation.create!(
      :sid => "Sid",
      :site_user => nil,
      :title => "Title",
      :description => "Description",
      :license_code => "License Code",
      :creation_status => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/License Code/)
    expect(rendered).to match(//)
  end
end
