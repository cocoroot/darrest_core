require 'rails_helper'

RSpec.describe "tag_classes/index", type: :view do
  before(:each) do
    assign(:tag_classes, [
      TagClass.create!(
        :name => "Name"
      ),
      TagClass.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of tag_classes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
