require 'rails_helper'

RSpec.describe "reports/new", type: :view do
  before(:each) do
    assign(:report, Report.new(
      :creation => nil,
      :user => nil,
      :title => "MyString",
      :detail => "MyText"
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input#report_creation_id[name=?]", "report[creation_id]"

      assert_select "input#report_user_id[name=?]", "report[user_id]"

      assert_select "input#report_title[name=?]", "report[title]"

      assert_select "textarea#report_detail[name=?]", "report[detail]"
    end
  end
end
