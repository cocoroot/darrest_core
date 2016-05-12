require 'rails_helper'

RSpec.describe "core/report_images/show", type: :view do
  before(:each) do
    @core_report_image = assign(:core_report_image, Core::ReportImage.create!(
      :report => nil,
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
  end
end
