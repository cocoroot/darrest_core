require 'rails_helper'

RSpec.describe "core/goods/new", type: :view do
  before(:each) do
    assign(:core_good, Core::Good.new(
      :creation => nil,
      :user => nil
    ))
  end

  it "renders new core_good form" do
    render

    assert_select "form[action=?][method=?]", core_goods_path, "post" do

      assert_select "input#core_good_creation_id[name=?]", "core_good[creation_id]"

      assert_select "input#core_good_user_id[name=?]", "core_good[user_id]"
    end
  end
end
