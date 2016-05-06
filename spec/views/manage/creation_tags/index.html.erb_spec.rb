require 'rails_helper'

RSpec.describe "manage/creation_tags/index", type: :view do
  before(:each) do
    assign(:manage_creation_tags, [
      Manage::CreationTag.create!(
        :creation => nil,
        :tag => nil
      ),
      Manage::CreationTag.create!(
        :creation => nil,
        :tag => nil
      )
    ])
  end

  it "renders a list of manage/creation_tags" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
