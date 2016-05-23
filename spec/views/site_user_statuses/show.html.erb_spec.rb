require 'rails_helper'

RSpec.describe "site_user_statuses/show", type: :view do
  before(:each) do
    @site_user_status = assign(:site_user_status, SiteUserStatus.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
