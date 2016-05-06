require 'rails_helper'

RSpec.describe "manage/report_images/edit", type: :view do
  before(:each) do
    @manage_report_image = assign(:manage_report_image, Manage::ReportImage.create!(
      :report => nil,
      :image => "MyString"
    ))
  end

  it "renders the edit manage_report_image form" do
    render

    assert_select "form[action=?][method=?]", manage_report_image_path(@manage_report_image), "post" do

      assert_select "input#manage_report_image_report_id[name=?]", "manage_report_image[report_id]"

      assert_select "input#manage_report_image_image[name=?]", "manage_report_image[image]"
    end
  end
end
