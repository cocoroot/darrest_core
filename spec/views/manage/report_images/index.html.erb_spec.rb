require 'rails_helper'

RSpec.describe "manage/report_images/index", type: :view do
  before(:each) do
    assign(:manage_report_images, [
      Manage::ReportImage.create!(
        :report => nil,
        :image => "Image"
      ),
      Manage::ReportImage.create!(
        :report => nil,
        :image => "Image"
      )
    ])
  end

  it "renders a list of manage/report_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
