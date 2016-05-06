require 'rails_helper'

RSpec.describe "Manage::Collections", type: :request do
  describe "GET /manage_collections" do
    it "works! (now write some real specs)" do
      get manage_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
