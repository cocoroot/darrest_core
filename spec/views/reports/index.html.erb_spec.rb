require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :creation => nil,
        :user => nil,
        :title => "Title",
        :detail => "MyText"
      ),
      Report.create!(
        :creation => nil,
        :user => nil,
        :title => "Title",
        :detail => "MyText"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
