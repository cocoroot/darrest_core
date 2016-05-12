require 'rails_helper'

RSpec.describe "core/reports/index", type: :view do
  before(:each) do
    assign(:core_reports, [
      Core::Report.create!(
        :creation => nil,
        :user => nil,
        :title => "Title",
        :detail => "MyText"
      ),
      Core::Report.create!(
        :creation => nil,
        :user => nil,
        :title => "Title",
        :detail => "MyText"
      )
    ])
  end

  it "renders a list of core/reports" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
