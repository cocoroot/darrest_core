require 'rails_helper'

RSpec.describe "manage/users/index", type: :view do
  before(:each) do
    assign(:manage_users, [
      Manage::User.create!(
        :baas_id => "Baas"
      ),
      Manage::User.create!(
        :baas_id => "Baas"
      )
    ])
  end

  it "renders a list of manage/users" do
    render
    assert_select "tr>td", :text => "Baas".to_s, :count => 2
  end
end
