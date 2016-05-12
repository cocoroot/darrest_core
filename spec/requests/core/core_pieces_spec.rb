require 'rails_helper'

RSpec.describe "Core::Pieces", type: :request do
  describe "GET /core_pieces" do
    it "works! (now write some real specs)" do
      get core_pieces_path
      expect(response).to have_http_status(200)
    end
  end
end
