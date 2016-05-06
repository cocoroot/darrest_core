require 'rails_helper'

RSpec.describe "manage/pieces/show", type: :view do
  before(:each) do
    @manage_piece = assign(:manage_piece, Manage::Piece.create!(
      :creation => nil,
      :name => "Name",
      :description => "MyText",
      :file_name => "MyText",
      :format => "Format",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Format/)
    expect(rendered).to match(/Image/)
  end
end
