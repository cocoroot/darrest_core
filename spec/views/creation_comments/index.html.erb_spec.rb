require 'rails_helper'

RSpec.describe "creation_comments/index", type: :view do
  before(:each) do
    assign(:creation_comments, [
      CreationComment.create!(
        :sid => "Sid",
        :creation => nil,
        :site_user => nil,
        :body => "Body",
        :parent => 1,
        :notice_code => "Notice Code"
      ),
      CreationComment.create!(
        :sid => "Sid",
        :creation => nil,
        :site_user => nil,
        :body => "Body",
        :parent => 1,
        :notice_code => "Notice Code"
      )
    ])
  end

  it "renders a list of creation_comments" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Notice Code".to_s, :count => 2
  end
end
