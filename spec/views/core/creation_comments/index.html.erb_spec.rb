require 'rails_helper'

RSpec.describe "core/creation_comments/index", type: :view do
  before(:each) do
    assign(:core_creation_comments, [
      Core::CreationComment.create!(
        :sid => "Sid",
        :creation => nil,
        :user => nil,
        :parent => nil,
        :notice_code => "Notice Code"
      ),
      Core::CreationComment.create!(
        :sid => "Sid",
        :creation => nil,
        :user => nil,
        :parent => nil,
        :notice_code => "Notice Code"
      )
    ])
  end

  it "renders a list of core/creation_comments" do
    render
    assert_select "tr>td", :text => "Sid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Notice Code".to_s, :count => 2
  end
end
