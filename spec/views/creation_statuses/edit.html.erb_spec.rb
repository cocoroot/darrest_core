require 'rails_helper'

RSpec.describe "creation_statuses/edit", type: :view do
  before(:each) do
    @creation_status = assign(:creation_status, CreationStatus.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit creation_status form" do
    render

    assert_select "form[action=?][method=?]", creation_status_path(@creation_status), "post" do

      assert_select "input#creation_status_name[name=?]", "creation_status[name]"
    end
  end
end
