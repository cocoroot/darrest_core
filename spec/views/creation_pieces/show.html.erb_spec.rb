require 'rails_helper'

RSpec.describe "creation_pieces/show", type: :view do
  before(:each) do
    @creation_piece = assign(:creation_piece, CreationPiece.create!(
      :creation => nil,
      :name => "Name",
      :description => "Description",
      :file_name => "File Name",
      :format => "Format",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/File Name/)
    expect(rendered).to match(/Format/)
    expect(rendered).to match(/Image/)
  end
end
