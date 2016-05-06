require 'rails_helper'

RSpec.describe "Manage::Pieces", type: :request do
  describe "GET /manage_pieces" do
    it "works! (now write some real specs)" do
      get manage_pieces_path
      expect(response).to have_http_status(200)
    end
  end
end
