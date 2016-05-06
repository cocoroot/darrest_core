require 'rails_helper'

RSpec.describe "core/users/edit", type: :view do
  before(:each) do
    @core_user = assign(:core_user, Core::User.create!(
      :baas_id => "MyString"
    ))
  end

  it "renders the edit core_user form" do
    render

    assert_select "form[action=?][method=?]", core_user_path(@core_user), "post" do

      assert_select "input#core_user_baas_id[name=?]", "core_user[baas_id]"
    end
  end
end
