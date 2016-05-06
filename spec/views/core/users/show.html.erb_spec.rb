require 'rails_helper'

RSpec.describe "core/users/show", type: :view do
  before(:each) do
    @core_user = assign(:core_user, Core::User.create!(
      :baas_id => "Baas"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Baas/)
  end
end
