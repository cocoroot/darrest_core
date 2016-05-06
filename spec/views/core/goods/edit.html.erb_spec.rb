require 'rails_helper'

RSpec.describe "core/goods/edit", type: :view do
  before(:each) do
    @core_good = assign(:core_good, Core::Good.create!(
      :creation => nil,
      :user => nil
    ))
  end

  it "renders the edit core_good form" do
    render

    assert_select "form[action=?][method=?]", core_good_path(@core_good), "post" do

      assert_select "input#core_good_creation_id[name=?]", "core_good[creation_id]"

      assert_select "input#core_good_user_id[name=?]", "core_good[user_id]"
    end
  end
end
