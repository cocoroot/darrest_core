require 'rails_helper'

RSpec.describe "site_users/show", type: :view do
  before(:each) do
    @site_user = assign(:site_user, SiteUser.create!(
      :sid => "Sid",
      :site => nil,
      :biography => "Biography",
      :tos_accepted => false,
      :site_user_status => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Biography/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
