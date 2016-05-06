require 'rails_helper'

RSpec.describe "manage/goods/edit", type: :view do
  before(:each) do
    @manage_good = assign(:manage_good, Manage::Good.create!(
      :creation => nil,
      :user => nil
    ))
  end

  it "renders the edit manage_good form" do
    render

    assert_select "form[action=?][method=?]", manage_good_path(@manage_good), "post" do

      assert_select "input#manage_good_creation_id[name=?]", "manage_good[creation_id]"

      assert_select "input#manage_good_user_id[name=?]", "manage_good[user_id]"
    end
  end
end
