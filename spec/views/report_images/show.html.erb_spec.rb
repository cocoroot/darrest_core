require 'rails_helper'

RSpec.describe "report_images/show", type: :view do
  before(:each) do
    @report_image = assign(:report_image, ReportImage.create!(
      :report => nil,
      :image => "Image",
      :order => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/1/)
  end
end
