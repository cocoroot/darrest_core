require 'rails_helper'

RSpec.describe "manage/reports/new", type: :view do
  before(:each) do
    assign(:manage_report, Manage::Report.new(
      :creation => nil,
      :user => nil,
      :title => "MyString",
      :detail => "MyText"
    ))
  end

  it "renders new manage_report form" do
    render

    assert_select "form[action=?][method=?]", manage_reports_path, "post" do

      assert_select "input#manage_report_creation_id[name=?]", "manage_report[creation_id]"

      assert_select "input#manage_report_user_id[name=?]", "manage_report[user_id]"

      assert_select "input#manage_report_title[name=?]", "manage_report[title]"

      assert_select "textarea#manage_report_detail[name=?]", "manage_report[detail]"
    end
  end
end
