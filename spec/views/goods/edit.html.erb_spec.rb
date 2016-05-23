require 'rails_helper'

RSpec.describe "goods/edit", type: :view do
  before(:each) do
    @good = assign(:good, Good.create!(
      :creation => nil,
      :site_user => nil
    ))
  end

  it "renders the edit good form" do
    render

    assert_select "form[action=?][method=?]", good_path(@good), "post" do

      assert_select "input#good_creation_id[name=?]", "good[creation_id]"

      assert_select "input#good_site_user_id[name=?]", "good[site_user_id]"
    end
  end
end
