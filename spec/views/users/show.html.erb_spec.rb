require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :baas_id => "Baas"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Baas/)
  end
end
