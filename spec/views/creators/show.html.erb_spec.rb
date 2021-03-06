require 'rails_helper'

RSpec.describe "creators/show", type: :view do
  before(:each) do
    @creator = assign(:creator, Creator.create!(
      :sid => "Sid",
      :user => nil,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
