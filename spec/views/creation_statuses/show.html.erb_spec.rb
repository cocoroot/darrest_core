require 'rails_helper'

RSpec.describe "creation_statuses/show", type: :view do
  before(:each) do
    @creation_status = assign(:creation_status, CreationStatus.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
