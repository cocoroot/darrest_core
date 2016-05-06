require 'rails_helper'

RSpec.describe "manage/tags/show", type: :view do
  before(:each) do
    @manage_tag = assign(:manage_tag, Manage::Tag.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
