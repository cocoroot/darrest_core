require 'rails_helper'

RSpec.describe "manage/reports/edit", type: :view do
  before(:each) do
    @manage_report = assign(:manage_report, Manage::Report.create!(
      :creation => nil,
      :user => nil,
      :title => "MyString",
      :detail => "MyText"
    ))
  end

  it "renders the edit manage_report form" do
    render

    assert_select "form[action=?][method=?]", manage_report_path(@manage_report), "post" do

      assert_select "input#manage_report_creation_id[name=?]", "manage_report[creation_id]"

      assert_select "input#manage_report_user_id[name=?]", "manage_report[user_id]"

      assert_select "input#manage_report_title[name=?]", "manage_report[title]"

      assert_select "textarea#manage_report_detail[name=?]", "manage_report[detail]"
    end
  end
end
