require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :baas_id => "Baas"
      ),
      User.create!(
        :baas_id => "Baas"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Baas".to_s, :count => 2
  end
end
