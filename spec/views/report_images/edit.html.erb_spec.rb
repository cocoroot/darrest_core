require 'rails_helper'

RSpec.describe "report_images/edit", type: :view do
  before(:each) do
    @report_image = assign(:report_image, ReportImage.create!(
      :report => nil,
      :image => "MyString",
      :order => 1
    ))
  end

  it "renders the edit report_image form" do
    render

    assert_select "form[action=?][method=?]", report_image_path(@report_image), "post" do

      assert_select "input#report_image_report_id[name=?]", "report_image[report_id]"

      assert_select "input#report_image_image[name=?]", "report_image[image]"

      assert_select "input#report_image_order[name=?]", "report_image[order]"
    end
  end
end
