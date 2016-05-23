require 'rails_helper'

RSpec.describe "tag_classes/show", type: :view do
  before(:each) do
    @tag_class = assign(:tag_class, TagClass.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
