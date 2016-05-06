require 'rails_helper'

RSpec.describe "core/report_images/index", type: :view do
  before(:each) do
    assign(:core_report_images, [
      Core::ReportImage.create!(
        :report => nil,
        :image => "Image"
      ),
      Core::ReportImage.create!(
        :report => nil,
        :image => "Image"
      )
    ])
  end

  it "renders a list of core/report_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
