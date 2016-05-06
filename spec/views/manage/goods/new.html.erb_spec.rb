require 'rails_helper'

RSpec.describe "manage/goods/new", type: :view do
  before(:each) do
    assign(:manage_good, Manage::Good.new(
      :creation => nil,
      :user => nil
    ))
  end

  it "renders new manage_good form" do
    render

    assert_select "form[action=?][method=?]", manage_goods_path, "post" do

      assert_select "input#manage_good_creation_id[name=?]", "manage_good[creation_id]"

      assert_select "input#manage_good_user_id[name=?]", "manage_good[user_id]"
    end
  end
end
