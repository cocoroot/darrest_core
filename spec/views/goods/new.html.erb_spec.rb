require 'rails_helper'

RSpec.describe "goods/new", type: :view do
  before(:each) do
    assign(:good, Good.new(
      :creation => nil,
      :user => nil
    ))
  end

  it "renders new good form" do
    render

    assert_select "form[action=?][method=?]", goods_path, "post" do

      assert_select "input#good_creation_id[name=?]", "good[creation_id]"

      assert_select "input#good_user_id[name=?]", "good[user_id]"
    end
  end
end
