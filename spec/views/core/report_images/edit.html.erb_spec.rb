require 'rails_helper'

RSpec.describe "core/report_images/edit", type: :view do
  before(:each) do
    @core_report_image = assign(:core_report_image, Core::ReportImage.create!(
      :report => nil,
      :image => "MyString"
    ))
  end

  it "renders the edit core_report_image form" do
    render

    assert_select "form[action=?][method=?]", core_report_image_path(@core_report_image), "post" do

      assert_select "input#core_report_image_report_id[name=?]", "core_report_image[report_id]"

      assert_select "input#core_report_image_image[name=?]", "core_report_image[image]"
    end
  end
end
