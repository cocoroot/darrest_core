require 'rails_helper'

RSpec.describe "sites/show", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      :name => "Name",
      :url => "Url",
      :access_key => "Access Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Access Key/)
  end
end
