require 'rails_helper'

RSpec.describe "core/users/index", type: :view do
  before(:each) do
    assign(:core_users, [
      Core::User.create!(
        :baas_id => "Baas"
      ),
      Core::User.create!(
        :baas_id => "Baas"
      )
    ])
  end

  it "renders a list of core/users" do
    render
    assert_select "tr>td", :text => "Baas".to_s, :count => 2
  end
end
