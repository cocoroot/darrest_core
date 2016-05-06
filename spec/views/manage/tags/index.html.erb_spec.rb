require 'rails_helper'

RSpec.describe "manage/tags/index", type: :view do
  before(:each) do
    assign(:manage_tags, [
      Manage::Tag.create!(
        :name => "Name"
      ),
      Manage::Tag.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of manage/tags" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
