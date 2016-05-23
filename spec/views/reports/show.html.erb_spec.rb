require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :creation => nil,
      :site_user => nil,
      :title => "Title",
      :detail => "Detail"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Detail/)
  end
end
