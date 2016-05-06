require 'rails_helper'

RSpec.describe "manage/users/show", type: :view do
  before(:each) do
    @manage_user = assign(:manage_user, Manage::User.create!(
      :baas_id => "Baas"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Baas/)
  end
end
