require 'rails_helper'

RSpec.describe "tag_classes/new", type: :view do
  before(:each) do
    assign(:tag_class, TagClass.new(
      :name => "MyString"
    ))
  end

  it "renders new tag_class form" do
    render

    assert_select "form[action=?][method=?]", tag_classes_path, "post" do

      assert_select "input#tag_class_name[name=?]", "tag_class[name]"
    end
  end
end
