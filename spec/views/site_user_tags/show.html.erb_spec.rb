require 'rails_helper'

RSpec.describe "site_user_tags/show", type: :view do
  before(:each) do
    @site_user_tag = assign(:site_user_tag, SiteUserTag.create!(
      :site_user => nil,
      :tag => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
