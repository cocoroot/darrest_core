require 'rails_helper'

RSpec.describe "creation_statuses/index", type: :view do
  before(:each) do
    assign(:creation_statuses, [
      CreationStatus.create!(
        :name => "Name"
      ),
      CreationStatus.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of creation_statuses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
