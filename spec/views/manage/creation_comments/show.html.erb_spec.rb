require 'rails_helper'

RSpec.describe "manage/creation_comments/show", type: :view do
  before(:each) do
    @manage_creation_comment = assign(:manage_creation_comment, Manage::CreationComment.create!(
      :sid => "Sid",
      :creation => nil,
      :user => nil,
      :parent => nil,
      :notice_code => "Notice Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Notice Code/)
  end
end
