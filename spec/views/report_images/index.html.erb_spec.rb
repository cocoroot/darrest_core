require 'rails_helper'

RSpec.describe "report_images/index", type: :view do
  before(:each) do
    assign(:report_images, [
      ReportImage.create!(
        :report => nil,
        :image => "Image"
      ),
      ReportImage.create!(
        :report => nil,
        :image => "Image"
      )
    ])
  end

  it "renders a list of report_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
