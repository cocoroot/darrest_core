require 'rails_helper'

RSpec.describe "manage/report_images/show", type: :view do
  before(:each) do
    @manage_report_image = assign(:manage_report_image, Manage::ReportImage.create!(
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
