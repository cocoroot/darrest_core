require 'rails_helper'

RSpec.describe "manage/report_images/new", type: :view do
  before(:each) do
    assign(:manage_report_image, Manage::ReportImage.new(
      :report => nil,
      :image => "MyString"
    ))
  end

  it "renders new manage_report_image form" do
    render

    assert_select "form[action=?][method=?]", manage_report_images_path, "post" do

      assert_select "input#manage_report_image_report_id[name=?]", "manage_report_image[report_id]"

      assert_select "input#manage_report_image_image[name=?]", "manage_report_image[image]"
    end
  end
end
