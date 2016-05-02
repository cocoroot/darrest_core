require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :baas_id => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_baas_id[name=?]", "user[baas_id]"
    end
  end
end
