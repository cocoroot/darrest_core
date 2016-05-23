require 'rails_helper'

RSpec.describe "creation_statuses/new", type: :view do
  before(:each) do
    assign(:creation_status, CreationStatus.new(
      :name => "MyString"
    ))
  end

  it "renders new creation_status form" do
    render

    assert_select "form[action=?][method=?]", creation_statuses_path, "post" do

      assert_select "input#creation_status_name[name=?]", "creation_status[name]"
    end
  end
end
