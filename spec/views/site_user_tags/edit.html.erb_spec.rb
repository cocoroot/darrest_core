require 'rails_helper'

RSpec.describe "site_user_tags/edit", type: :view do
  before(:each) do
    @site_user_tag = assign(:site_user_tag, SiteUserTag.create!(
      :site_user => nil,
      :tag => nil
    ))
  end

  it "renders the edit site_user_tag form" do
    render

    assert_select "form[action=?][method=?]", site_user_tag_path(@site_user_tag), "post" do

      assert_select "input#site_user_tag_site_user_id[name=?]", "site_user_tag[site_user_id]"

      assert_select "input#site_user_tag_tag_id[name=?]", "site_user_tag[tag_id]"
    end
  end
end
