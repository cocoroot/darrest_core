require 'rails_helper'

RSpec.describe "creation_comments/show", type: :view do
  before(:each) do
    @creation_comment = assign(:creation_comment, CreationComment.create!(
      :sid => "Sid",
      :creation => nil,
      :site_user => nil,
      :body => "Body",
      :parent => 1,
      :notice_code => "Notice Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sid/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Notice Code/)
  end
end
