require 'rails_helper'

RSpec.describe "manage/users/new", type: :view do
  before(:each) do
    assign(:manage_user, Manage::User.new(
      :baas_id => "MyString"
    ))
  end

  it "renders new manage_user form" do
    render

    assert_select "form[action=?][method=?]", manage_users_path, "post" do

      assert_select "input#manage_user_baas_id[name=?]", "manage_user[baas_id]"
    end
  end
end
