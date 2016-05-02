require 'rails_helper'

RSpec.describe "report_images/new", type: :view do
  before(:each) do
    assign(:report_image, ReportImage.new(
      :report => nil,
      :image => "MyString"
    ))
  end

  it "renders new report_image form" do
    render

    assert_select "form[action=?][method=?]", report_images_path, "post" do

      assert_select "input#report_image_report_id[name=?]", "report_image[report_id]"

      assert_select "input#report_image_image[name=?]", "report_image[image]"
    end
  end
end
