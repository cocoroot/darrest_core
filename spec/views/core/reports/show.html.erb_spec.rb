require 'rails_helper'

RSpec.describe "core/reports/show", type: :view do
  before(:each) do
    @core_report = assign(:core_report, Core::Report.create!(
      :creation => nil,
      :user => nil,
      :title => "Title",
      :detail => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
