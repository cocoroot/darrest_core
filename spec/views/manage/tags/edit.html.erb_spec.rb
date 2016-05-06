require 'rails_helper'

RSpec.describe "manage/tags/edit", type: :view do
  before(:each) do
    @manage_tag = assign(:manage_tag, Manage::Tag.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit manage_tag form" do
    render

    assert_select "form[action=?][method=?]", manage_tag_path(@manage_tag), "post" do

      assert_select "input#manage_tag_name[name=?]", "manage_tag[name]"
    end
  end
end
