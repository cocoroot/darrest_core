require 'rails_helper'

RSpec.describe "manage/users/edit", type: :view do
  before(:each) do
    @manage_user = assign(:manage_user, Manage::User.create!(
      :baas_id => "MyString"
    ))
  end

  it "renders the edit manage_user form" do
    render

    assert_select "form[action=?][method=?]", manage_user_path(@manage_user), "post" do

      assert_select "input#manage_user_baas_id[name=?]", "manage_user[baas_id]"
    end
  end
end
