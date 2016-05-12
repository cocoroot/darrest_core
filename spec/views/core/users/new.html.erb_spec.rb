require 'rails_helper'

RSpec.describe "core/users/new", type: :view do
  before(:each) do
    assign(:core_user, Core::User.new(
      :baas_id => "MyString"
    ))
  end

  it "renders new core_user form" do
    render

    assert_select "form[action=?][method=?]", core_users_path, "post" do

      assert_select "input#core_user_baas_id[name=?]", "core_user[baas_id]"
    end
  end
end
