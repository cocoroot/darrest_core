require 'rails_helper'

RSpec.describe "core/reports/edit", type: :view do
  before(:each) do
    @core_report = assign(:core_report, Core::Report.create!(
      :creation => nil,
      :user => nil,
      :title => "MyString",
      :detail => "MyText"
    ))
  end

  it "renders the edit core_report form" do
    render

    assert_select "form[action=?][method=?]", core_report_path(@core_report), "post" do

      assert_select "input#core_report_creation_id[name=?]", "core_report[creation_id]"

      assert_select "input#core_report_user_id[name=?]", "core_report[user_id]"

      assert_select "input#core_report_title[name=?]", "core_report[title]"

      assert_select "textarea#core_report_detail[name=?]", "core_report[detail]"
    end
  end
end
