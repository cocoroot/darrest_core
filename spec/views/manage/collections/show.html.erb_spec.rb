require 'rails_helper'

RSpec.describe "manage/collections/show", type: :view do
  before(:each) do
    @manage_collection = assign(:manage_collection, Manage::Collection.create!(
      :sid => "Sid",
      :user => nil,
      :title => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
